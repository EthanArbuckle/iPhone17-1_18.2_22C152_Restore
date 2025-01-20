@interface _XREngineeringTypeDef
+ (id)_elementNameToClassMap;
+ (id)_elementNameToKVCMap;
- (BOOL)deprecated;
- (BOOL)experimental;
- (NSString)enumString;
- (NSString)mnemonic;
- (NSString)title;
- (NSString)usage;
- (XREngineeringTypeEncodingConvention)encodingConvention;
- (id)errorStringHeader;
- (int64_t)conventionalBitWidth;
- (unint64_t)attributes;
- (unsigned)impl;
- (void)_handleCompletion;
- (void)addAttribute:(unint64_t)a3;
- (void)didHandleEncodingElement;
- (void)setAttributes:(unint64_t)a3;
- (void)setDeprecated:(BOOL)a3;
- (void)setEncodingConvention:(id)a3;
- (void)setEnumString:(id)a3;
- (void)setExperimental:(BOOL)a3;
- (void)setImpl:(unsigned __int8)a3;
- (void)setMnemonic:(id)a3;
- (void)setTitle:(id)a3;
- (void)setUsage:(id)a3;
@end

@implementation _XREngineeringTypeDef

+ (id)_elementNameToClassMap
{
  if (qword_2687AA1B8 != -1) {
    dispatch_once(&qword_2687AA1B8, &unk_26E752730);
  }
  v2 = (void *)qword_2687AA1B0;

  return v2;
}

+ (id)_elementNameToKVCMap
{
  if (qword_2687AA1C8 != -1) {
    dispatch_once(&qword_2687AA1C8, &unk_26E752750);
  }
  v2 = (void *)qword_2687AA1C0;

  return v2;
}

- (void)addAttribute:(unint64_t)a3
{
  self->_attributes |= a3;
}

- (void)didHandleEncodingElement
{
  self->_handledEncodingElement = 1;
}

- (void)_handleCompletion
{
  if (!self->_handledEncodingElement) {
    ((void (*)(_XREngineeringTypeDef *, char *, __CFString *))MEMORY[0x270F9A6D0])(self, sel_simulateEmptyElement_, @"encoding-convention");
  }
}

- (id)errorStringHeader
{
  if (qword_2687AA1D0 != -1) {
    dispatch_once(&qword_2687AA1D0, &unk_26E752770);
  }
  v6 = NSString;
  v7 = [qword_2687AA1D8 performSelector:a2 withObject:v2 withObject:v3 withObject:v4];
  v12 = [self lineAndColumnForElementStart:v8 column:v9 line:v10];
  v16 = [v6 stringWithFormat:@"%@:%@: error:", v14, v15, v7, v12];

  return v16;
}

- (int64_t)conventionalBitWidth
{
  uint64_t v6 = [self a2:v2 v3:v3 v4:v4];
  if (!v6
    || (uint64_t v11 = (void *)v6,
        [self _setValue:v7 forKey:v8 withTreatment:v9 withTransitionContext:v10];
        v12 = objc_claimAutoreleasedReturnValue(),
        uint64_t v17 = [v12 v13:v14:v15:v16],
        v12,
        v11,
        v17 == -1))
  {
    unsigned int v25 = [self v7:v8 v9:v10];
    if (v25 >= 7) {
      return 22;
    }
    else {
      return qword_2345A03F0[(char)v25];
    }
  }
  else
  {
    v18 = [self v7:v8 v9:v10];
    int64_t v23 = [v18 v19:v20:v21:v22];

    return v23;
  }
}

- (NSString)mnemonic
{
  return self->_mnemonic;
}

- (void)setMnemonic:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)enumString
{
  return self->_enumString;
}

- (void)setEnumString:(id)a3
{
}

- (NSString)usage
{
  return self->_usage;
}

- (void)setUsage:(id)a3
{
}

- (unsigned)impl
{
  return self->_impl;
}

- (void)setImpl:(unsigned __int8)a3
{
  self->_impl = a3;
}

- (unint64_t)attributes
{
  return self->_attributes;
}

- (void)setAttributes:(unint64_t)a3
{
  self->_attributes = a3;
}

- (BOOL)experimental
{
  return self->_experimental;
}

- (void)setExperimental:(BOOL)a3
{
  self->_experimental = a3;
}

- (BOOL)deprecated
{
  return self->_deprecated;
}

- (void)setDeprecated:(BOOL)a3
{
  self->_deprecated = a3;
}

- (XREngineeringTypeEncodingConvention)encodingConvention
{
  return self->_encodingConvention;
}

- (void)setEncodingConvention:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encodingConvention, 0);
  objc_storeStrong((id *)&self->_usage, 0);
  objc_storeStrong((id *)&self->_enumString, 0);
  objc_storeStrong((id *)&self->_title, 0);

  objc_storeStrong((id *)&self->_mnemonic, 0);
}

@end