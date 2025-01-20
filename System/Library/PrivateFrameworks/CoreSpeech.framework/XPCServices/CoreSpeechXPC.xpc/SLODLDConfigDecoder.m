@interface SLODLDConfigDecoder
- (BOOL)isSPMModelMmapable;
- (NSDictionary)dictionary;
- (NSString)resourcePath;
- (SLODLDConfigDecoder)initWithConfigFile:(id)a3;
- (id)getBertModelFile;
- (id)getBertModelOutputNodes;
- (id)getConfigVersion;
- (id)getOdldModelBnnsIrWeightFile;
- (id)getOutputSpecs;
- (id)getRegexMapConfig;
- (id)getSPMEncoderOptions;
- (id)getSPMModelFile;
- (unint64_t)getInputType;
- (unint64_t)getPreProcessorType;
- (unint64_t)getTokenizerType;
- (void)setDictionary:(id)a3;
- (void)setResourcePath:(id)a3;
@end

@implementation SLODLDConfigDecoder

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dictionary, 0);
  objc_storeStrong((id *)&self->_resourcePath, 0);
}

- (void)setDictionary:(id)a3
{
}

- (NSDictionary)dictionary
{
  return self->_dictionary;
}

- (void)setResourcePath:(id)a3
{
}

- (NSString)resourcePath
{
  return self->_resourcePath;
}

- (BOOL)isSPMModelMmapable
{
  v2 = +[CSFModelConfigDecoder getOdldValueForKey:@"tokenizer" categoryKey:kODLDPipelineKey configDict:self->_dictionary];
  v3 = [v2 objectForKeyedSubscript:@"mmapModel"];

  if (v3)
  {
    v4 = [v2 objectForKeyedSubscript:@"mmapModel"];
    LOBYTE(v3) = [v4 BOOLValue];
  }
  return (char)v3;
}

- (id)getBertModelOutputNodes
{
  v2 = +[CSFModelConfigDecoder getOdldValueForKey:kODLDModelKey categoryKey:kODLDPipelineKey configDict:self->_dictionary];
  v3 = [v2 objectForKeyedSubscript:@"outputNodeName"];

  if (v3)
  {
    v3 = [v2 objectForKeyedSubscript:@"outputNodeName"];
  }

  return v3;
}

- (id)getOdldModelBnnsIrWeightFile
{
  v3 = +[CSFModelConfigDecoder getOdldValueForKey:@"BnnsIrWeightFile" categoryKey:kODLDPipelineKey configDict:self->_dictionary];
  v4 = [(SLODLDConfigDecoder *)self getBertModelFile];
  if ([v4 hasSuffix:CSBnnsIrSuffix]
    && ([v3 objectForKeyedSubscript:@"BnnsIrWeightFile"],
        v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        v5))
  {
    resourcePath = self->_resourcePath;
    v7 = [v3 objectForKeyedSubscript:@"BnnsIrWeightFile"];
    v8 = [(NSString *)resourcePath stringByAppendingPathComponent:v7];
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)getBertModelFile
{
  return +[CSFModelConfigDecoder getOdldModelFileFromConfigDict:self->_dictionary resourcePath:self->_resourcePath];
}

- (id)getSPMEncoderOptions
{
  v2 = +[CSFModelConfigDecoder getOdldValueForKey:@"tokenizer" categoryKey:kODLDPipelineKey configDict:self->_dictionary];
  v3 = [v2 objectForKeyedSubscript:@"spmEncodeOptions"];

  if (v3)
  {
    v3 = [v2 objectForKeyedSubscript:@"spmEncodeOptions"];
  }

  return v3;
}

- (id)getSPMModelFile
{
  v3 = +[CSFModelConfigDecoder getOdldValueForKey:@"tokenizer" categoryKey:kODLDPipelineKey configDict:self->_dictionary];
  v4 = [v3 objectForKeyedSubscript:@"spmModel"];

  if (v4)
  {
    resourcePath = self->_resourcePath;
    v6 = [v3 objectForKeyedSubscript:@"spmModel"];
    v7 = [(NSString *)resourcePath stringByAppendingPathComponent:v6];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)getRegexMapConfig
{
  v3 = +[CSFModelConfigDecoder getOdldValueForKey:@"preprocessing" categoryKey:kODLDPipelineKey configDict:self->_dictionary];
  v4 = [v3 objectForKeyedSubscript:@"regexMapConfig"];

  if (v4)
  {
    resourcePath = self->_resourcePath;
    v6 = [v3 objectForKeyedSubscript:@"regexMapConfig"];
    v7 = [(NSString *)resourcePath stringByAppendingPathComponent:v6];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)getTokenizerType
{
  v2 = +[CSFModelConfigDecoder getOdldValueForKey:@"tokenizer" categoryKey:kODLDPipelineKey configDict:self->_dictionary];
  v3 = [v2 objectForKeyedSubscript:@"spmModel"];

  return v3 != 0;
}

- (unint64_t)getPreProcessorType
{
  v2 = +[CSFModelConfigDecoder getOdldValueForKey:@"preprocessing" categoryKey:kODLDPipelineKey configDict:self->_dictionary];
  v3 = [v2 objectForKeyedSubscript:@"regexMapConfig"];

  return v3 != 0;
}

- (id)getOutputSpecs
{
  return [(NSDictionary *)self->_dictionary objectForKeyedSubscript:@"outputSpecs"];
}

- (unint64_t)getInputType
{
  v2 = [(NSDictionary *)self->_dictionary objectForKeyedSubscript:@"inputType"];
  if ([v2 isEqualToString:@"PostITN"])
  {
    unint64_t v3 = 1;
  }
  else if ([v2 isEqualToString:@"PreITN"])
  {
    unint64_t v3 = 2;
  }
  else
  {
    unint64_t v3 = 0;
  }

  return v3;
}

- (id)getConfigVersion
{
  return [(NSDictionary *)self->_dictionary objectForKeyedSubscript:@"version"];
}

- (SLODLDConfigDecoder)initWithConfigFile:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)SLODLDConfigDecoder;
  v5 = [(SLODLDConfigDecoder *)&v18 init];
  if (!v5) {
    goto LABEL_8;
  }
  v6 = +[CSFModelConfigDecoder decodeJsonFromFile:v4];
  v7 = v6;
  if (v6)
  {
    v8 = [(NSDictionary *)v6 objectForKeyedSubscript:@"version"];

    if (v8)
    {
LABEL_7:
      uint64_t v14 = [v4 stringByDeletingLastPathComponent];
      resourcePath = v5->_resourcePath;
      v5->_resourcePath = (NSString *)v14;

      NSLog(@"Decoded config at path: %@", v5->_resourcePath);
      dictionary = v5->_dictionary;
      v5->_dictionary = v7;

LABEL_8:
      v13 = v5;
      goto LABEL_9;
    }
  }
  v9 = +[NSString stringWithFormat:@"Missing config for regex matcher %@", v7];
  CFStringRef v19 = @"reason";
  v20 = v9;
  v10 = +[NSDictionary dictionaryWithObjects:&v20 forKeys:&v19 count:1];
  v11 = +[NSError errorWithDomain:@"com.apple.sl" code:115 userInfo:v10];

  if (!v11)
  {

    goto LABEL_7;
  }
  v12 = [v11 localizedDescription];
  NSLog(@"%@", v12);

  v13 = 0;
LABEL_9:

  return v13;
}

@end