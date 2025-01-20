@interface GCGenericDevicePhysicalInputElementModelBuilder
+ (Class)modelClass;
- (BOOL)isEqual:(id)a3;
- (GCGenericDevicePhysicalInputElementModelBuilder)init;
- (GCGenericDevicePhysicalInputElementModelBuilder)initWithDictionaryRepresentation:(id)a3 error:(id *)a4;
- (NSArray)names;
- (NSNumber)isAnalog;
- (NSString)identifier;
- (NSString)localizedNameKey;
- (NSString)symbolName;
- (id)build;
- (unint64_t)hash;
- (void)initializeWithModel:(id)a3;
- (void)reset;
- (void)setAnalog:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setLocalizedNameKey:(id)a3;
- (void)setNames:(id)a3;
- (void)setSymbolName:(id)a3;
@end

@implementation GCGenericDevicePhysicalInputElementModelBuilder

- (GCGenericDevicePhysicalInputElementModelBuilder)init
{
  uint64_t v4 = objc_opt_class();
  if (v4 == objc_opt_class()) {
    [(GCGenericDevicePhysicalInputElementModelBuilder *)self doesNotRecognizeSelector:a2];
  }
  v6.receiver = self;
  v6.super_class = (Class)GCGenericDevicePhysicalInputElementModelBuilder;
  return [(GCGenericDevicePhysicalInputElementModelBuilder *)&v6 init];
}

+ (Class)modelClass
{
  return (Class)objc_opt_class();
}

- (void)initializeWithModel:(id)a3
{
  id v4 = a3;
  v5 = [v4 identifier];
  [(GCGenericDevicePhysicalInputElementModelBuilder *)self setIdentifier:v5];

  objc_super v6 = [v4 names];
  [(GCGenericDevicePhysicalInputElementModelBuilder *)self setNames:v6];

  v7 = [v4 isAnalog];
  [(GCGenericDevicePhysicalInputElementModelBuilder *)self setAnalog:v7];

  v8 = [v4 localizedNameKey];
  [(GCGenericDevicePhysicalInputElementModelBuilder *)self setLocalizedNameKey:v8];

  id v9 = [v4 symbolName];

  [(GCGenericDevicePhysicalInputElementModelBuilder *)self setSymbolName:v9];
}

- (void)reset
{
  [(GCGenericDevicePhysicalInputElementModelBuilder *)self setIdentifier:0];
  [(GCGenericDevicePhysicalInputElementModelBuilder *)self setNames:0];
  [(GCGenericDevicePhysicalInputElementModelBuilder *)self setAnalog:0];
  [(GCGenericDevicePhysicalInputElementModelBuilder *)self setLocalizedNameKey:0];

  [(GCGenericDevicePhysicalInputElementModelBuilder *)self setSymbolName:0];
}

- (id)build
{
  id v4 = objc_alloc((Class)[(id)objc_opt_class() modelClass]);
  v5 = [(GCGenericDevicePhysicalInputElementModelBuilder *)self identifier];
  if (!v5)
  {
    v21 = unk_26BEED9E8(&off_26BEEDB50, "currentHandler");
    [v21 handleFailureInMethod:a2 object:self file:@"GCGenericDevicePhysicalInputElementModel.m" lineNumber:154 description:@"'identifier' can not be nil"];
  }
  uint64_t v6 = [v5 copy];
  v7 = (void *)v4[1];
  v4[1] = v6;

  v8 = [(GCGenericDevicePhysicalInputElementModelBuilder *)self names];
  if (!v8)
  {
    v22 = unk_26BEED9E8(&off_26BEEDB50, "currentHandler");
    [v22 handleFailureInMethod:a2 object:self file:@"GCGenericDevicePhysicalInputElementModel.m" lineNumber:158 description:@"'names' can not be nil"];
  }
  if (![v8 count])
  {
    v23 = unk_26BEED9E8(&off_26BEEDB50, "currentHandler");
    [v23 handleFailureInMethod:a2 object:self file:@"GCGenericDevicePhysicalInputElementModel.m" lineNumber:159 description:@"'names' can not be empty"];
  }
  uint64_t v9 = [v8 copy];
  v10 = (void *)v4[2];
  v4[2] = v9;

  v11 = [(GCGenericDevicePhysicalInputElementModelBuilder *)self isAnalog];
  uint64_t v12 = [v11 copy];
  v13 = (void *)v4[3];
  v4[3] = v12;

  v14 = [(GCGenericDevicePhysicalInputElementModelBuilder *)self localizedNameKey];
  uint64_t v15 = [v14 copy];
  v16 = (void *)v4[4];
  v4[4] = v15;

  v17 = [(GCGenericDevicePhysicalInputElementModelBuilder *)self symbolName];
  uint64_t v18 = [v17 copy];
  v19 = (void *)v4[5];
  v4[5] = v18;

  return v4;
}

- (unint64_t)hash
{
  v2 = (void *)[(id)objc_opt_class() modelClass];

  return [v2 hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unsigned __int8 v5 = [v4 isEqual:self];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)GCGenericDevicePhysicalInputElementModelBuilder;
    unsigned __int8 v5 = [(GCGenericDevicePhysicalInputElementModelBuilder *)&v8 isEqual:v4];
  }
  BOOL v6 = v5;

  return v6;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSArray)names
{
  return self->_names;
}

- (void)setNames:(id)a3
{
}

- (NSNumber)isAnalog
{
  return self->_analog;
}

- (void)setAnalog:(id)a3
{
}

- (NSString)localizedNameKey
{
  return self->_localizedNameKey;
}

- (void)setLocalizedNameKey:(id)a3
{
}

- (NSString)symbolName
{
  return self->_symbolName;
}

- (void)setSymbolName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_symbolName, 0);
  objc_storeStrong((id *)&self->_localizedNameKey, 0);
  objc_storeStrong((id *)&self->_analog, 0);
  objc_storeStrong((id *)&self->_names, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

- (GCGenericDevicePhysicalInputElementModelBuilder)initWithDictionaryRepresentation:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [(GCGenericDevicePhysicalInputElementModelBuilder *)self init];
  id v62 = 0;
  objc_super v8 = objc_msgSend(v6, "gc_requiredObjectForKey:ofClass:error:", @"Identifier", objc_opt_class(), &v62);
  id v9 = v62;
  if (!v8)
  {
    if (a4)
    {
      v73[0] = NSLocalizedDescriptionKey;
      v24 = +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", @"Invalid '%@' definition.", [(id)objc_opt_class() modelClass]);
      v74[0] = v24;
      v73[1] = NSLocalizedFailureReasonErrorKey;
      v25 = [v9 localizedFailureReason];
      v74[1] = v25;
      v26 = +[NSDictionary dictionaryWithObjects:v74 forKeys:v73 count:2];
      +[NSError gc_modelError:userInfo:]((uint64_t)&off_26BEEAB30, 1, (uint64_t)v26);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_6;
  }
  [(GCGenericDevicePhysicalInputElementModelBuilder *)v7 setIdentifier:v8];

  id v61 = 0;
  v10 = objc_msgSend(v6, "gc_requiredObjectForKey:ofClass:error:", @"Aliases", objc_opt_class(), &v61);
  id v11 = v61;
  if (!v10)
  {
    if (a4)
    {
      v71[0] = NSLocalizedDescriptionKey;
      v27 = +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", @"Invalid '%@' definition.", [(id)objc_opt_class() modelClass]);
      v72[0] = v27;
      v71[1] = NSLocalizedFailureReasonErrorKey;
      v28 = [v11 localizedFailureReason];
      v72[1] = v28;
      v29 = +[NSDictionary dictionaryWithObjects:v72 forKeys:v71 count:2];
      +[NSError gc_modelError:userInfo:]((uint64_t)&off_26BEEAB30, 1, (uint64_t)v29);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_6;
  }
  uint64_t v55 = 0;
  v56 = &v55;
  uint64_t v57 = 0x3032000000;
  v58 = __Block_byref_object_copy_;
  v59 = __Block_byref_object_dispose_;
  id v60 = 0;
  v54[0] = _NSConcreteStackBlock;
  v54[1] = 3221225472;
  v54[2] = __105__GCGenericDevicePhysicalInputElementModelBuilder_Serialization__initWithDictionaryRepresentation_error___block_invoke;
  v54[3] = &unk_26BEC3A60;
  v54[4] = &v55;
  objc_msgSend(v10, "gc_enumerateObjectsUsingBlock:", v54);
  uint64_t v12 = v56[5];
  if (v12)
  {
    if (a4)
    {
      v69[0] = NSLocalizedDescriptionKey;
      v50 = +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", @"Invalid '%@' definition.", [(id)objc_opt_class() modelClass]);
      v70[0] = v50;
      v69[1] = NSLocalizedFailureReasonErrorKey;
      uint64_t v30 = [(id)v56[5] localizedFailureReason];
      v49 = (void *)v30;
      v31 = &stru_26BED82A0;
      if (v30) {
        v31 = (__CFString *)v30;
      }
      v70[1] = v31;
      v69[2] = NSUnderlyingErrorKey;
      uint64_t v32 = v56[5];
      if (v32)
      {
        v33 = (void *)v56[5];
        uint64_t v34 = (uint64_t)v33;
      }
      else
      {
        uint64_t v34 = +[NSNull null];
        v33 = (void *)v56[5];
      }
      v47 = (void *)v34;
      v70[2] = v34;
      v69[3] = @"GCFailingKeyPathErrorKey";
      v44 = objc_msgSend(v33, "gc_failingKeyPath");
      v45 = v44;
      if (!v44) {
        v44 = &__NSArray0__struct;
      }
      v48 = [v44 arrayByAddingObject:@"Aliases"];
      v70[3] = v48;
      v46 = +[NSDictionary dictionaryWithObjects:v70 forKeys:v69 count:4];
      +[NSError gc_modelError:userInfo:]((uint64_t)&off_26BEEAB30, 1, (uint64_t)v46);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

      if (!v32) {
    }
      }
  }
  else
  {
    [(GCGenericDevicePhysicalInputElementModelBuilder *)v7 setNames:v10];
  }
  _Block_object_dispose(&v55, 8);

  if (v12)
  {
LABEL_6:
    v13 = 0;
    goto LABEL_20;
  }
  id v53 = 0;
  v14 = objc_msgSend(v6, "gc_objectForKey:ofClass:error:", @"Analog", objc_opt_class(), &v53);
  id v15 = v53;
  v16 = v15;
  if (!v14 && v15)
  {
    if (a4)
    {
      v67[0] = NSLocalizedDescriptionKey;
      v35 = +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", @"Invalid '%@' definition.", [(id)objc_opt_class() modelClass]);
      v68[0] = v35;
      v67[1] = NSLocalizedFailureReasonErrorKey;
      v36 = [v16 localizedFailureReason];
      v68[1] = v36;
      v37 = +[NSDictionary dictionaryWithObjects:v68 forKeys:v67 count:2];
      +[NSError gc_modelError:userInfo:]((uint64_t)&off_26BEEAB30, 1, (uint64_t)v37);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_6;
  }
  if (v14) {
    [(GCGenericDevicePhysicalInputElementModelBuilder *)v7 setAnalog:v14];
  }

  id v52 = 0;
  v17 = objc_msgSend(v6, "gc_objectForKey:ofClass:error:", @"LocalizedNameKey", objc_opt_class(), &v52);
  id v18 = v52;
  v19 = v18;
  if (!v17 && v18)
  {
    if (a4)
    {
      v65[0] = NSLocalizedDescriptionKey;
      v38 = +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", @"Invalid '%@' definition.", [(id)objc_opt_class() modelClass]);
      v66[0] = v38;
      v65[1] = NSLocalizedFailureReasonErrorKey;
      v39 = [v19 localizedFailureReason];
      v66[1] = v39;
      v40 = +[NSDictionary dictionaryWithObjects:v66 forKeys:v65 count:2];
      +[NSError gc_modelError:userInfo:]((uint64_t)&off_26BEEAB30, 1, (uint64_t)v40);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_6;
  }
  if (v17) {
    [(GCGenericDevicePhysicalInputElementModelBuilder *)v7 setLocalizedNameKey:v17];
  }

  id v51 = 0;
  v20 = objc_msgSend(v6, "gc_objectForKey:ofClass:error:", @"SymbolName", objc_opt_class(), &v51);
  id v21 = v51;
  v22 = v21;
  if (!v20 && v21)
  {
    if (a4)
    {
      v63[0] = NSLocalizedDescriptionKey;
      v41 = +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", @"Invalid '%@' definition.", [(id)objc_opt_class() modelClass]);
      v64[0] = v41;
      v63[1] = NSLocalizedFailureReasonErrorKey;
      v42 = [v22 localizedFailureReason];
      v64[1] = v42;
      v43 = +[NSDictionary dictionaryWithObjects:v64 forKeys:v63 count:2];
      +[NSError gc_modelError:userInfo:]((uint64_t)&off_26BEEAB30, 1, (uint64_t)v43);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_6;
  }
  if (v20) {
    [(GCGenericDevicePhysicalInputElementModelBuilder *)v7 setSymbolName:v20];
  }

  v13 = v7;
LABEL_20:

  return v13;
}

void __105__GCGenericDevicePhysicalInputElementModelBuilder_Serialization__initWithDictionaryRepresentation_error___block_invoke(uint64_t a1, void (**a2)(void, void, void), uint64_t a3, unsigned char *a4)
{
  objc_super v8 = a2;
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 8);
  id obj = *(id *)(v10 + 40);
  id v11 = ((void (**)(void, uint64_t, id *))a2)[2](v8, v9, &obj);

  objc_storeStrong((id *)(v10 + 40), obj);
  if (!v11)
  {
    v21[0] = NSLocalizedFailureReasonErrorKey;
    uint64_t v12 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) localizedFailureReason];
    v22[0] = v12;
    v21[1] = @"GCFailingKeyPathErrorKey";
    v13 = +[NSString stringWithFormat:@"[%zd]", a3];
    v20 = v13;
    v14 = +[NSArray arrayWithObjects:&v20 count:1];
    v22[1] = v14;
    id v15 = +[NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:2];
    uint64_t v16 = +[NSError gc_modelError:userInfo:]((uint64_t)&off_26BEEAB30, 1, (uint64_t)v15);
    uint64_t v17 = *(void *)(*(void *)(a1 + 32) + 8);
    id v18 = *(void **)(v17 + 40);
    *(void *)(v17 + 40) = v16;

    *a4 = 1;
  }
}

@end