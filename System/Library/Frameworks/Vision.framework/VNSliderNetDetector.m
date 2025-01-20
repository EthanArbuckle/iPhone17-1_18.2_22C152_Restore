@interface VNSliderNetDetector
+ (id)inputImageBlobNameForConfiguration:(id)a3;
+ (id)modelPathForConfiguration:(id)a3 error:(id *)a4;
+ (id)supportedAdjustmentKeys;
+ (unsigned)analysisPixelFormatTypeForConfiguration:(id)a3;
- (BOOL)configureImageAnalyzerOptions:(void *)a3 error:(id *)a4;
- (id)observationsForLastAnalysisOfImageAnalyzer:(void *)a3 processOptions:(id)a4 originatingRequestSpecifier:(id)a5 qosClass:(unsigned int)a6 error:(id *)a7;
- (unsigned)analysisTypesForProcessOptions:(id)a3;
@end

@implementation VNSliderNetDetector

- (id)observationsForLastAnalysisOfImageAnalyzer:(void *)a3 processOptions:(id)a4 originatingRequestSpecifier:(id)a5 qosClass:(unsigned int)a6 error:(id *)a7
{
  v31[1] = *MEMORY[0x1E4F143B8];
  id v26 = a4;
  id v27 = a5;
  uint64_t SlidersAdjustments = vision::mod::ImageAnalyzer::getSlidersAdjustments((vision::mod::ImageAnalyzer *)v28, a3);
  context = (void *)MEMORY[0x1A6257080](SlidersAdjustments);
  id v10 = objc_alloc(MEMORY[0x1E4F1CA60]);
  v11 = (void *)[v10 initWithCapacity:v30];
  for (i = v29; i; i = (uint64_t *)*i)
  {
    id v13 = [NSString alloc];
    v14 = i + 2;
    if (*((char *)i + 39) < 0) {
      v14 = (void *)*v14;
    }
    v15 = objc_msgSend(v13, "initWithUTF8String:", v14, context, v26);
    v16 = objc_msgSend(v15, "substringWithRange:", 14, objc_msgSend(v15, "length") - 29);
    v17 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:(i[6] - i[5]) >> 2];
    v19 = (_DWORD *)i[5];
    v20 = (_DWORD *)i[6];
    while (v19 != v20)
    {
      LODWORD(v18) = *v19;
      v21 = [NSNumber numberWithFloat:v18];
      [v17 addObject:v21];

      ++v19;
    }
    [v11 setObject:v17 forKey:v16];
  }
  v22 = [[VN1vLyVSh30UQ26TGBoV8MHv alloc] initWithOriginatingRequestSpecifier:v27 adjustments:v11];
  v31[0] = v22;
  v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:1];

  std::__hash_table<std::__hash_value_type<std::string,std::vector<float>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::vector<float>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::vector<float>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::vector<float>>>>::~__hash_table((uint64_t)v28);

  return v23;
}

- (unsigned)analysisTypesForProcessOptions:(id)a3
{
  return 256;
}

- (BOOL)configureImageAnalyzerOptions:(void *)a3 error:(id *)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v23.receiver = self;
  v23.super_class = (Class)VNSliderNetDetector;
  if (![(VNImageAnalyzerBasedDetector *)&v23 configureImageAnalyzerOptions:a3 error:a4])return 0; {
  v5 = [(id)objc_opt_class() supportedAdjustmentKeys];
  }
  BOOL v17 = v5 != 0;
  if (v5)
  {
    std::vector<std::string>::__clear[abi:ne180100]((uint64_t *)a3 + 42);
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v6 = v5;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v19 objects:v24 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v20 != v8) {
            objc_enumerationMutation(v6);
          }
          id v10 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          std::string::basic_string[abi:ne180100]<0>(&v18, "AEEnhancerNet/");
          v11 = (const char *)[v10 UTF8String];
          std::string::size_type v12 = strlen(v11);
          std::string::append(&v18, v11, v12);
          std::string::append(&v18, "/final_output:0", 0xFuLL);
          unint64_t v13 = *((void *)a3 + 43);
          if (v13 >= *((void *)a3 + 44))
          {
            std::vector<std::string>::pointer v15 = std::vector<std::string>::__push_back_slow_path<std::string const&>((std::vector<std::string> *)a3 + 14, (long long *)&v18);
          }
          else
          {
            if (SHIBYTE(v18.__r_.__value_.__r.__words[2]) < 0)
            {
              std::string::__init_copy_ctor_external(*((std::string **)a3 + 43), v18.__r_.__value_.__l.__data_, v18.__r_.__value_.__l.__size_);
            }
            else
            {
              long long v14 = *(_OWORD *)&v18.__r_.__value_.__l.__data_;
              *(void *)(v13 + 16) = *((void *)&v18.__r_.__value_.__l + 2);
              *(_OWORD *)unint64_t v13 = v14;
            }
            std::vector<std::string>::pointer v15 = (std::vector<std::string>::pointer)(v13 + 24);
            *((void *)a3 + 43) = v13 + 24;
          }
          *((void *)a3 + 43) = v15;
          if (SHIBYTE(v18.__r_.__value_.__r.__words[2]) < 0) {
            operator delete(v18.__r_.__value_.__l.__data_);
          }
        }
        uint64_t v7 = [v6 countByEnumeratingWithState:&v19 objects:v24 count:16];
      }
      while (v7);
    }
  }
  return v17;
}

+ (unsigned)analysisPixelFormatTypeForConfiguration:(id)a3
{
  return 1111970369;
}

+ (id)inputImageBlobNameForConfiguration:(id)a3
{
  return @"image:0";
}

+ (id)modelPathForConfiguration:(id)a3 error:(id *)a4
{
  v4 = +[VNEspressoHelpers pathForEspressoNetworkModelFileWithName:@"sliderflow-s6xrskinrc_29001.espresso" error:a4];

  return v4;
}

+ (id)supportedAdjustmentKeys
{
  return &unk_1EF7A7E20;
}

@end