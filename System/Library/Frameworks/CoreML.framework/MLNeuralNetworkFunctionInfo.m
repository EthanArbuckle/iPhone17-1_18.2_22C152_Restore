@interface MLNeuralNetworkFunctionInfo
- (BOOL)isClassifier;
- (MLNeuralNetworkFunctionInfo)initWithCompiledModelArchive:(void *)a3 compilerVersionInfo:(id)a4 error:(id *)a5;
- (NSArray)classLabels;
- (NSArray)outputNames;
- (NSString)classScoreVectorName;
- (id)description;
@end

@implementation MLNeuralNetworkFunctionInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputNames, 0);
  objc_storeStrong((id *)&self->_classScoreVectorName, 0);

  objc_storeStrong((id *)&self->_classLabels, 0);
}

- (MLNeuralNetworkFunctionInfo)initWithCompiledModelArchive:(void *)a3 compilerVersionInfo:(id)a4 error:(id *)a5
{
  id v7 = a4;
  v29.receiver = self;
  v29.super_class = (Class)MLNeuralNetworkFunctionInfo;
  v8 = [(MLNeuralNetworkFunctionInfo *)&v29 init];
  if (!v8) {
    goto LABEL_35;
  }
  __p.__r_.__value_.__r.__words[0] = 0;
  operator>>((uint64_t)a3);
  id v9 = 0;
  uint64_t data_low = LODWORD(__p.__r_.__value_.__l.__data_);
  memset(&v28, 0, sizeof(v28));
  BOOL v11 = LODWORD(__p.__r_.__value_.__l.__data_) == 403;
  if (LODWORD(__p.__r_.__value_.__l.__data_) == 403)
  {
    v32 = 0;
    operator>>((uint64_t)a3);
    id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    if (v32 == 100)
    {
      unint64_t v31 = 0;
      operator>>((uint64_t)a3);
      if (v31)
      {
        for (unint64_t i = 0; i < v31; ++i)
        {
          memset(&__p, 0, sizeof(__p));
          operator>>((uint64_t)a3, &__p);
          if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
            p_p = &__p;
          }
          else {
            p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
          }
          v17 = objc_msgSend(NSString, "stringWithUTF8String:", p_p, v28.__r_.__value_.__r.__words[0]);
          [v12 addObject:v17];

          if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
            operator delete(__p.__r_.__value_.__l.__data_);
          }
        }
      }
    }
    else
    {
      if (v32 != 101)
      {
        id v9 = 0;
        goto LABEL_19;
      }
      __p.__r_.__value_.__r.__words[0] = 0;
      operator>>((uint64_t)a3);
      if (__p.__r_.__value_.__r.__words[0])
      {
        std::string::size_type v13 = 0;
        do
        {
          unint64_t v31 = 0;
          operator>>((uint64_t)a3);
          v14 = [NSNumber numberWithLongLong:v31];
          [v12 addObject:v14];

          ++v13;
        }
        while (v13 < __p.__r_.__value_.__r.__words[0]);
      }
    }
    id v9 = v12;
LABEL_19:

    v18 = +[MLVersionInfo versionInfoWithMajor:1 minor:1 patch:0 variant:&stru_1EF0E81D0];
    if (([v7 olderThan:v18] & 1) == 0) {
      operator>>((uint64_t)a3, &v28);
    }
  }
  memset(&__p, 0, sizeof(__p));
  operator>><std::string>((uint64_t)a3, (std::vector<std::string> *)&__p);
  CoreML::stringArrayToObjC((uint64_t **)&__p);
  v19 = (NSArray *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (data_low == 403)
  {
    if (SHIBYTE(v28.__r_.__value_.__r.__words[2]) < 0)
    {
      if (v28.__r_.__value_.__l.__size_)
      {
        v21 = (std::string *)v28.__r_.__value_.__r.__words[0];
        goto LABEL_29;
      }
    }
    else if (*((unsigned char *)&v28.__r_.__value_.__s + 23))
    {
      v21 = &v28;
LABEL_29:
      uint64_t v23 = objc_msgSend(NSString, "stringWithUTF8String:", v21, v28.__r_.__value_.__r.__words[0]);
LABEL_31:
      v22 = (NSString *)v23;
      goto LABEL_32;
    }
    uint64_t v23 = [(NSArray *)v19 firstObject];
    goto LABEL_31;
  }
  v22 = 0;
LABEL_32:
  v8->_isClassifier = v11;
  objc_storeStrong((id *)&v8->_classLabels, v9);
  classScoreVectorName = v8->_classScoreVectorName;
  v8->_classScoreVectorName = v22;
  v25 = v22;

  outputNames = v8->_outputNames;
  v8->_outputNames = v20;

  v32 = &__p;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v32);
  if (SHIBYTE(v28.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v28.__r_.__value_.__l.__data_);
  }

LABEL_35:
  return v8;
}

- (NSArray)classLabels
{
  return self->_classLabels;
}

- (NSArray)outputNames
{
  return self->_outputNames;
}

- (NSString)classScoreVectorName
{
  return self->_classScoreVectorName;
}

- (BOOL)isClassifier
{
  return self->_isClassifier;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] string];
  v4 = [(MLNeuralNetworkFunctionInfo *)self outputNames];
  v5 = [v4 componentsJoinedByString:@","];
  [v3 appendFormat:@"outputNames: [%@]\n", v5];

  if ([(MLNeuralNetworkFunctionInfo *)self isClassifier])
  {
    v6 = [(MLNeuralNetworkFunctionInfo *)self classScoreVectorName];
    [v3 appendFormat:@"classScoreVectorName: %@\n", v6];

    id v7 = [(MLNeuralNetworkFunctionInfo *)self classLabels];
    v8 = [v7 componentsJoinedByString:@","];
    [v3 appendFormat:@"classLabels: [%@]\n", v8];
  }

  return v3;
}

@end