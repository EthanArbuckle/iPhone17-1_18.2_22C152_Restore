@interface MLE5InputPortBinder
- (BOOL)_reusableForFeatureValue:(id)a3 directMode:(unsigned __int8)a4;
- (BOOL)bindMemoryObjectForFeatureValue:(id)a3 error:(id *)a4;
- (BOOL)copyFeatureValue:(id)a3 error:(id *)a4;
- (BOOL)reusableForFeatureValue:(id)a3 willBindDirectly:(BOOL *)a4;
- (MLE5InputPortBinder)initWithPort:(e5rt_io_port *)a3 featureDescription:(id)a4;
- (MLFeatureDescription)featureDescription;
- (MLFeatureValue)directlyBoundFeatureValue;
- (MLPixelBufferPool)pixelBufferPool;
- (e5rt_io_port)portHandle;
- (unsigned)bindingMode;
- (void)dealloc;
- (void)reset;
- (void)setBindingMode:(unsigned __int8)a3;
- (void)setDirectlyBoundFeatureValue:(id)a3;
- (void)setPixelBufferPool:(id)a3;
@end

@implementation MLE5InputPortBinder

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_directlyBoundFeatureValue, 0);
  objc_storeStrong((id *)&self->_featureDescription, 0);

  objc_storeStrong((id *)&self->_pixelBufferPool, 0);
}

- (void)setDirectlyBoundFeatureValue:(id)a3
{
}

- (MLFeatureValue)directlyBoundFeatureValue
{
  return self->_directlyBoundFeatureValue;
}

- (MLFeatureDescription)featureDescription
{
  return (MLFeatureDescription *)objc_getProperty(self, a2, 40, 1);
}

- (e5rt_io_port)portHandle
{
  return self->_portHandle;
}

- (void)setBindingMode:(unsigned __int8)a3
{
  self->_bindingMode = a3;
}

- (unsigned)bindingMode
{
  return self->_bindingMode;
}

- (void)setPixelBufferPool:(id)a3
{
}

- (MLPixelBufferPool)pixelBufferPool
{
  return self->_pixelBufferPool;
}

- (void)reset
{
  self->_temporarilyBoundPixelBuffer = 0;
}

- (BOOL)copyFeatureValue:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if ([(MLE5InputPortBinder *)self bindingMode] != 2)
  {
    v7 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v15 = 0;
      _os_log_error_impl(&dword_19E58B000, v7, OS_LOG_TYPE_ERROR, "Tried to copy feature value to port for directly bound feature value.", v15, 2u);
    }

    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"Tried to copy feature value to port for directly bound feature value."];
  }
  v8 = [(MLE5InputPortBinder *)self portHandle];
  unsigned int v9 = MLE5PortTraitOf();
  unsigned int v10 = MLE5FeatureTraitOf(v6);
  InputBindFunction = MLE5FindInputBindFunction(v9, v10, 2u, a4);
  if (InputBindFunction)
  {
    v12 = [(MLE5InputPortBinder *)self featureDescription];
    char v13 = ((uint64_t (*)(id, e5rt_io_port *, void *, id *))InputBindFunction)(v6, v8, v12, a4);
  }
  else
  {
    char v13 = 0;
  }

  return v13;
}

- (BOOL)bindMemoryObjectForFeatureValue:(id)a3 error:(id *)a4
{
  id v6 = a3;
  [(MLE5InputPortBinder *)self portHandle];
  unsigned int v7 = MLE5PortTraitOf();
  unsigned int v8 = MLE5FeatureTraitOf(v6);
  DirectInputModeFunction = (uint64_t (*)(id, e5rt_io_port *, id *))MLE5FindDirectInputModeFunction(v7, v8, a4);
  if (!DirectInputModeFunction) {
    goto LABEL_9;
  }
  uint64_t v10 = DirectInputModeFunction(v6, [(MLE5InputPortBinder *)self portHandle], a4);
  if ([(MLE5InputPortBinder *)self _reusableForFeatureValue:v6 directMode:v10])
  {
LABEL_3:
    LOBYTE(v11) = 1;
    goto LABEL_10;
  }
  [(MLE5InputPortBinder *)self setBindingMode:0];
  if (v10 == 2)
  {
    CVPixelBufferRelease(self->_temporarilyBoundPixelBuffer);
    v16 = [(MLE5InputPortBinder *)self portHandle];
    v17 = [(MLE5InputPortBinder *)self pixelBufferPool];
    int v11 = MLE5BindEmptyMemoryObjectToPort((uint64_t)v16, v17, &self->_temporarilyBoundPixelBuffer, a4);

    if (!v11) {
      goto LABEL_10;
    }
    [(MLE5InputPortBinder *)self setDirectlyBoundFeatureValue:0];
    [(MLE5InputPortBinder *)self setBindingMode:2];
    goto LABEL_3;
  }
  if (v10 != 1 || (InputBindFunction = MLE5FindInputBindFunction(v7, v8, 1u, a4)) == 0)
  {
LABEL_9:
    LOBYTE(v11) = 0;
    goto LABEL_10;
  }
  char v13 = [(MLE5InputPortBinder *)self portHandle];
  v14 = [(MLE5InputPortBinder *)self featureDescription];
  int v11 = ((uint64_t (*)(id, e5rt_io_port *, void *, id *))InputBindFunction)(v6, v13, v14, a4);

  if (v11)
  {
    [(MLE5InputPortBinder *)self setDirectlyBoundFeatureValue:v6];
    LOBYTE(v11) = 1;
    [(MLE5InputPortBinder *)self setBindingMode:1];
  }
LABEL_10:

  return v11;
}

- (BOOL)reusableForFeatureValue:(id)a3 willBindDirectly:(BOOL *)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  [(MLE5InputPortBinder *)self portHandle];
  unsigned int v7 = MLE5PortTraitOf();
  unsigned int v8 = MLE5FeatureTraitOf(v6);
  {
    portCompatibilityFunctionTable(void)::table = 0u;
    *(_OWORD *)&qword_1E9460120 = 0u;
    dword_1E9460130 = 1065353216;
  }
  if (portCompatibilityFunctionTable(void)::onceToken != -1) {
    dispatch_once(&portCompatibilityFunctionTable(void)::onceToken, &__block_literal_global_14929);
  }
  if (!*((void *)&portCompatibilityFunctionTable(void)::table + 1)) {
    goto LABEL_23;
  }
  unint64_t v9 = ((unint64_t)v7 << 24) | ((unint64_t)v8 << 16);
  uint8x8_t v10 = (uint8x8_t)vcnt_s8(*(int8x8_t *)((char *)&portCompatibilityFunctionTable(void)::table + 8));
  v10.i16[0] = vaddlv_u8(v10);
  if (v10.u32[0] > 1uLL)
  {
    unint64_t v11 = ((unint64_t)v7 << 24) | ((unint64_t)v8 << 16);
    if (v9 >= *((void *)&portCompatibilityFunctionTable(void)::table + 1)) {
      unint64_t v11 = v9 % *((void *)&portCompatibilityFunctionTable(void)::table + 1);
    }
  }
  else
  {
    unint64_t v11 = v9 & (*((void *)&portCompatibilityFunctionTable(void)::table + 1) - 1);
  }
  v12 = *(uint64_t ***)(portCompatibilityFunctionTable(void)::table + 8 * v11);
  if (!v12 || (char v13 = *v12) == 0)
  {
LABEL_23:
    v15 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v18 = off_1E59A4930[v7];
      v19 = off_1E59A4948[v8];
      int v23 = 138412546;
      v24 = v18;
      __int16 v25 = 2112;
      v26 = v19;
      _os_log_error_impl(&dword_19E58B000, v15, OS_LOG_TYPE_ERROR, "The feature is invalid or unsupported. (port trait %@, feature trait %@.)", (uint8_t *)&v23, 0x16u);
    }
    goto LABEL_26;
  }
  while (1)
  {
    unint64_t v14 = v13[1];
    if (v9 == v14) {
      break;
    }
    if (v10.u32[0] > 1uLL)
    {
      if (v14 >= *((void *)&portCompatibilityFunctionTable(void)::table + 1)) {
        v14 %= *((void *)&portCompatibilityFunctionTable(void)::table + 1);
      }
    }
    else
    {
      v14 &= *((void *)&portCompatibilityFunctionTable(void)::table + 1) - 1;
    }
    if (v14 != v11) {
      goto LABEL_23;
    }
LABEL_22:
    char v13 = (uint64_t *)*v13;
    if (!v13) {
      goto LABEL_23;
    }
  }
  if (*((unsigned __int8 *)v13 + 16) != v7 || *((unsigned __int8 *)v13 + 17) != v8 || *((unsigned char *)v13 + 18) || v13[3]) {
    goto LABEL_22;
  }
  v20 = (unsigned int (*)(id, e5rt_io_port *))v13[4];
  if (!v20
    || !v20(v6, [(MLE5InputPortBinder *)self portHandle])
    || (DirectInputModeFunction = (uint64_t (*)(id, e5rt_io_port *, void))MLE5FindDirectInputModeFunction(v7, v8, 0)) == 0)
  {
LABEL_26:
    BOOL v16 = 0;
    goto LABEL_27;
  }
  uint64_t v22 = DirectInputModeFunction(v6, [(MLE5InputPortBinder *)self portHandle], 0);
  BOOL v16 = [(MLE5InputPortBinder *)self _reusableForFeatureValue:v6 directMode:v22];
  if (a4) {
    *a4 = v22 == 1;
  }
LABEL_27:

  return v16;
}

- (BOOL)_reusableForFeatureValue:(id)a3 directMode:(unsigned __int8)a4
{
  int v4 = a4;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (v4 != 1)
  {
    if (v4 != 2) {
      goto LABEL_29;
    }
    char v7 = [(MLE5InputPortBinder *)self bindingMode] == 2;
    goto LABEL_30;
  }
  [(MLE5InputPortBinder *)self portHandle];
  unsigned int v8 = MLE5PortTraitOf();
  unsigned int v9 = MLE5FeatureTraitOf(v6);
  {
    inputReusabilityFunctionTable(void)::table = 0u;
    *(_OWORD *)&qword_1E9460150 = 0u;
    dword_1E9460160 = 1065353216;
  }
  if (inputReusabilityFunctionTable(void)::onceToken != -1) {
    dispatch_once(&inputReusabilityFunctionTable(void)::onceToken, &__block_literal_global_57_12726);
  }
  if (!*((void *)&inputReusabilityFunctionTable(void)::table + 1)) {
    goto LABEL_26;
  }
  unint64_t v10 = ((unint64_t)v8 << 24) | ((unint64_t)v9 << 16);
  uint8x8_t v11 = (uint8x8_t)vcnt_s8(*(int8x8_t *)((char *)&inputReusabilityFunctionTable(void)::table + 8));
  v11.i16[0] = vaddlv_u8(v11);
  if (v11.u32[0] > 1uLL)
  {
    unint64_t v12 = ((unint64_t)v8 << 24) | ((unint64_t)v9 << 16);
    if (v10 >= *((void *)&inputReusabilityFunctionTable(void)::table + 1)) {
      unint64_t v12 = v10 % *((void *)&inputReusabilityFunctionTable(void)::table + 1);
    }
  }
  else
  {
    unint64_t v12 = v10 & (*((void *)&inputReusabilityFunctionTable(void)::table + 1) - 1);
  }
  char v13 = *(uint64_t ***)(inputReusabilityFunctionTable(void)::table + 8 * v12);
  if (!v13 || (unint64_t v14 = *v13) == 0)
  {
LABEL_26:
    BOOL v16 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v18 = off_1E59A4930[v8];
      v19 = off_1E59A4948[v9];
      int v22 = 138412546;
      int v23 = v18;
      __int16 v24 = 2112;
      __int16 v25 = v19;
      _os_log_error_impl(&dword_19E58B000, v16, OS_LOG_TYPE_ERROR, "The input feature value is invalid or unsupported. (Port trait %@, feature trait %@.)", (uint8_t *)&v22, 0x16u);
    }
    goto LABEL_29;
  }
  while (1)
  {
    unint64_t v15 = v14[1];
    if (v10 == v15) {
      break;
    }
    if (v11.u32[0] > 1uLL)
    {
      if (v15 >= *((void *)&inputReusabilityFunctionTable(void)::table + 1)) {
        v15 %= *((void *)&inputReusabilityFunctionTable(void)::table + 1);
      }
    }
    else
    {
      v15 &= *((void *)&inputReusabilityFunctionTable(void)::table + 1) - 1;
    }
    if (v15 != v12) {
      goto LABEL_26;
    }
LABEL_25:
    unint64_t v14 = (uint64_t *)*v14;
    if (!v14) {
      goto LABEL_26;
    }
  }
  if (*((unsigned __int8 *)v14 + 16) != v8 || *((unsigned __int8 *)v14 + 17) != v9 || *((unsigned char *)v14 + 18) || v14[3]) {
    goto LABEL_25;
  }
  v20 = (uint64_t (*)(id, void *, e5rt_io_port *))v14[4];
  if (v20)
  {
    v21 = [(MLE5InputPortBinder *)self directlyBoundFeatureValue];
    char v7 = v20(v6, v21, [(MLE5InputPortBinder *)self portHandle]);

    goto LABEL_30;
  }
LABEL_29:
  char v7 = 0;
LABEL_30:

  return v7;
}

- (void)dealloc
{
  CVPixelBufferRelease(self->_temporarilyBoundPixelBuffer);
  self->_temporarilyBoundPixelBuffer = 0;
  v3.receiver = self;
  v3.super_class = (Class)MLE5InputPortBinder;
  [(MLE5InputPortBinder *)&v3 dealloc];
}

- (MLE5InputPortBinder)initWithPort:(e5rt_io_port *)a3 featureDescription:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)MLE5InputPortBinder;
  unsigned int v8 = [(MLE5InputPortBinder *)&v11 init];
  unsigned int v9 = v8;
  if (v8)
  {
    v8->_portHandle = a3;
    objc_storeStrong((id *)&v8->_featureDescription, a4);
    v9->_bindingMode = 0;
  }

  return v9;
}

@end