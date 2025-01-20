@interface BWRenderListParameters
+ (void)initialize;
- (BWRenderListParameterList)parameterList;
- (BWRenderListParameters)init;
- (BWRenderListParameters)initWithParameterList:(BWRenderListParameterList *)a3;
- (NSString)description;
- (void)dealloc;
@end

@implementation BWRenderListParameters

- (BWRenderListParameterList)parameterList
{
  return &self->_parameterList;
}

- (BWRenderListParameters)init
{
  return [(BWRenderListParameters *)self initWithParameterList:0];
}

- (BWRenderListParameters)initWithParameterList:(BWRenderListParameterList *)a3
{
  v13.receiver = self;
  v13.super_class = (Class)BWRenderListParameters;
  v4 = [(BWRenderListParameters *)&v13 init];
  v5 = v4;
  if (v4)
  {
    v4->_parameterList.slh_first = 0;
    if (a3)
    {
      slh_first = a3->slh_first;
      if (a3->slh_first)
      {
        v7 = 0;
        do
        {
          v8 = (void *)*((void *)slh_first + 1);
          v9 = (BWRenderListParameterNode *)malloc_type_malloc(0x10uLL, 0xA0040AFF93C70uLL);
          uint64_t v10 = [v8 copyWithZone:0];
          if (v7) {
            p_parameterList = v7;
          }
          else {
            p_parameterList = &v5->_parameterList;
          }
          *(void *)v9 = p_parameterList->slh_first;
          *((void *)v9 + 1) = v10;
          p_parameterList->slh_first = v9;
          slh_first = *(BWRenderListParameterNode **)slh_first;
          v7 = (BWRenderListParameterList *)v9;
        }
        while (slh_first);
      }
    }
  }
  return v5;
}

+ (void)initialize
{
}

- (void)dealloc
{
  p_parameterList = &self->_parameterList;
  slh_first = self->_parameterList.slh_first;
  if (slh_first)
  {
    do
    {
      v5 = *(BWRenderListParameterNode **)slh_first;

      v6 = p_parameterList->slh_first;
      v7 = p_parameterList;
      while (v6 != slh_first)
      {
        v7 = (BWRenderListParameterList *)v6;
        v6 = *(BWRenderListParameterNode **)v6;
      }
      v7->slh_first = *(BWRenderListParameterNode **)slh_first;
      free(slh_first);
      slh_first = v5;
    }
    while (v5);
  }
  v8.receiver = self;
  v8.super_class = (Class)BWRenderListParameters;
  [(BWRenderListParameters *)&v8 dealloc];
}

- (NSString)description
{
  v3 = (void *)[MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p>: ", objc_opt_class(), self];
  v4 = v3;
  if (self)
  {
    slh_first = self->_parameterList.slh_first;
    if (slh_first) {
      v6 = @", Parameters: ";
    }
    else {
      v6 = @", No Parameters";
    }
    [v3 appendString:v6];
    if (slh_first)
    {
      uint64_t v7 = 0;
      do
      {
        objc_super v8 = (objc_class *)objc_opt_class();
        [v4 appendFormat:@"[%u] %@ ", v7, NSStringFromClass(v8)];
        slh_first = *(BWRenderListParameterNode **)slh_first;
        uint64_t v7 = (v7 + 1);
      }
      while (slh_first);
    }
  }
  else
  {
    [v3 appendString:@", No Parameters"];
  }
  return (NSString *)v4;
}

@end