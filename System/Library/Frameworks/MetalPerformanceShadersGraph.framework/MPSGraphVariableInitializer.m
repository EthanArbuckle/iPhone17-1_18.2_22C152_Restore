@interface MPSGraphVariableInitializer
+ (id)initializerWithConstant:(double)a3;
+ (id)initializerWithFile:(id)a3;
+ (id)initializerWithOnes;
+ (id)initializerWithRandomUniformWithMinimum:(double)a3 maximum:(double)a4;
+ (id)initializerWithZeros;
- (MPSGraphVariableInitializer)init;
- (id)initializedDataWithNumberOfValues:(unint64_t)a3 dataType:(unsigned int)a4;
- (unsigned)initializerType;
@end

@implementation MPSGraphVariableInitializer

- (id)initializedDataWithNumberOfValues:(unint64_t)a3 dataType:(unsigned int)a4
{
  if (a4 != 268435488 && MTLReportFailureTypeEnabled()) {
    MTLReportFailure();
  }
  size_t v6 = 4 * a3;
  v7 = malloc_type_malloc(4 * a3, 0x100004052888210uLL);
  v8 = v7;
  *(float *)&unsigned int v9 = self->_constant;
  uint64_t __pattern4 = v9;
  unsigned int initializerType = self->_initializerType;
  if (initializerType)
  {
    if (initializerType == 2)
    {
      v17 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:self->_file];
      if (!v17 && MTLReportFailureTypeEnabled())
      {
        file = self->_file;
        MTLReportFailure();
      }
      id v18 = v17;
      memcpy(v8, (const void *)[v18 bytes], v6);
    }
    else if (initializerType == 1 && a3 != 0)
    {
      v12 = (float *)v7;
      do
      {
        int v13 = rand_r((unsigned int *)&__pattern4 + 1);
        double minimum = self->_minimum;
        float v15 = (self->_maximum - minimum) * (float)((float)v13 * 4.6566e-10);
        ++HIDWORD(__pattern4);
        float v16 = v15 - minimum;
        *v12++ = v16;
        --a3;
      }
      while (a3);
    }
  }
  else
  {
    memset_pattern4(v7, &__pattern4, 4 * a3);
  }
  v19 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytesNoCopy:length:freeWhenDone:", v8, v6, 1, file, __pattern4);

  return v19;
}

- (MPSGraphVariableInitializer)init
{
  v3.receiver = self;
  v3.super_class = (Class)MPSGraphVariableInitializer;
  result = [(MPSGraphVariableInitializer *)&v3 init];
  result->_constant = 0.0;
  result->_double minimum = -INFINITY;
  result->_maximum = INFINITY;
  return result;
}

+ (id)initializerWithConstant:(double)a3
{
  v4 = objc_alloc_init(MPSGraphVariableInitializer);
  v4->_unsigned int initializerType = 0;
  v4->_constant = a3;

  return v4;
}

+ (id)initializerWithZeros
{
  v2 = objc_alloc_init(MPSGraphVariableInitializer);
  v2->_unsigned int initializerType = 0;
  v2->_constant = 0.0;

  return v2;
}

+ (id)initializerWithOnes
{
  v2 = objc_alloc_init(MPSGraphVariableInitializer);
  v2->_unsigned int initializerType = 0;
  v2->_constant = 1.0;

  return v2;
}

+ (id)initializerWithRandomUniformWithMinimum:(double)a3 maximum:(double)a4
{
  if (a4 <= a3 && MTLReportFailureTypeEnabled()) {
    MTLReportFailure();
  }
  size_t v6 = objc_alloc_init(MPSGraphVariableInitializer);
  v6->_unsigned int initializerType = 1;
  v6->_double minimum = a3;
  v6->_maximum = a4;

  return v6;
}

+ (id)initializerWithFile:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(MPSGraphVariableInitializer);
  v5->_unsigned int initializerType = 2;
  objc_storeStrong((id *)&v5->_file, a3);
  if (!v4) {
    __assert_rtn("+[MPSGraphVariableInitializer initializerWithFile:]", "MPSGraphHighLevelOps.mm", 71, "file");
  }

  return v5;
}

- (unsigned)initializerType
{
  return self->_initializerType;
}

- (void).cxx_destruct
{
}

@end