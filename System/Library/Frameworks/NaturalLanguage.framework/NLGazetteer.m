@interface NLGazetteer
+ (BOOL)writeGazetteerForDictionary:(NSDictionary *)dictionary language:(NLLanguage)language toURL:(NSURL *)url error:(NSError *)error;
+ (BOOL)writeGazetteerMLModelForDictionary:(id)a3 language:(id)a4 toURL:(id)a5 options:(id)a6 error:(id *)a7;
+ (NLGazetteer)gazetteerWithContentsOfURL:(NSURL *)url error:(NSError *)error;
+ (NLGazetteer)gazetteerWithData:(id)a3 error:(id *)a4;
+ (NLGazetteer)gazetteerWithMLModel:(id)a3 error:(id *)a4;
- (BOOL)writeMLModelToURL:(id)a3 options:(id)a4 error:(id *)a5;
- (NLGazetteer)initWithContentsOfURL:(NSURL *)url error:(NSError *)error;
- (NLGazetteer)initWithData:(NSData *)data error:(NSError *)error;
- (NLGazetteer)initWithDictionary:(NSDictionary *)dictionary language:(NLLanguage)language error:(NSError *)error;
- (NLGazetteer)initWithMLModel:(id)a3 error:(id *)a4;
- (NLGazetteer)initWithNLModel:(id)a3 error:(id *)p_isa;
- (NLLanguage)language;
- (NSData)data;
- (NSString)labelForString:(NSString *)string;
- (id)labels;
- (id)modelDescription;
- (void)_addImplementationToArray:(__CFArray *)a3;
- (void)_gazetteerRef;
- (void)dealloc;
@end

@implementation NLGazetteer

+ (NLGazetteer)gazetteerWithContentsOfURL:(NSURL *)url error:(NSError *)error
{
  v5 = url;
  v6 = (void *)[objc_alloc((Class)objc_opt_class()) initWithContentsOfURL:v5 error:error];

  return (NLGazetteer *)v6;
}

+ (NLGazetteer)gazetteerWithData:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = (void *)[objc_alloc((Class)objc_opt_class()) initWithData:v5 error:a4];

  return (NLGazetteer *)v6;
}

+ (NLGazetteer)gazetteerWithMLModel:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = (void *)[objc_alloc((Class)objc_opt_class()) initWithMLModel:v5 error:a4];

  return (NLGazetteer *)v6;
}

- (NLGazetteer)initWithContentsOfURL:(NSURL *)url error:(NSError *)error
{
  v33[1] = *MEMORY[0x1E4F143B8];
  v6 = url;
  v7 = [(NSURL *)v6 path];
  v8 = [v7 pathExtension];
  v9 = [MEMORY[0x1E4F28CB8] defaultManager];
  char v25 = 0;
  if (([v9 fileExistsAtPath:v7 isDirectory:&v25] & 1) == 0)
  {
    if (!error) {
      goto LABEL_10;
    }
    v13 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v32 = *MEMORY[0x1E4F28568];
    v33[0] = @"Could not find gazetteer file";
    v14 = (void *)MEMORY[0x1E4F1C9E8];
    v15 = (__CFString **)v33;
    v16 = &v32;
    goto LABEL_8;
  }
  if (v25) {
    goto LABEL_3;
  }
  if ([v8 isEqualToString:@"mlmodel"])
  {
    if (!error) {
      goto LABEL_10;
    }
    v13 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v30 = *MEMORY[0x1E4F28568];
    v31 = @"Cannot load gazetteer from uncompiled mlmodel file";
    v14 = (void *)MEMORY[0x1E4F1C9E8];
    v15 = &v31;
    v16 = &v30;
LABEL_8:
    v17 = [v14 dictionaryWithObjects:v15 forKeys:v16 count:1];
    *error = [v13 errorWithDomain:@"NLNaturalLanguageErrorDomain" code:1 userInfo:v17];

    goto LABEL_9;
  }
  if (!v25)
  {
    id v24 = 0;
    uint64_t v28 = *MEMORY[0x1E4F5C7E0];
    v29 = v6;
    v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v29 forKeys:&v28 count:1];
    uint64_t v19 = NLGazetteerCreate();
    if (v19)
    {
      v20 = (void *)v19;
      v23.receiver = self;
      v23.super_class = (Class)NLGazetteer;
      v12 = [(NLGazetteer *)&v23 init];
      if (v12) {
        v12->_gazetteer = v20;
      }
      goto LABEL_5;
    }
    if (error)
    {
      v21 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v26 = *MEMORY[0x1E4F28568];
      v27 = @"Failed to load gazetteer file";
      v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v27 forKeys:&v26 count:1];
      *error = [v21 errorWithDomain:@"NLNaturalLanguageErrorDomain" code:1 userInfo:v22];
    }
  }
LABEL_3:
  uint64_t v10 = +[NLModel modelWithContentsOfURL:v6 error:error];
  if (!v10)
  {
LABEL_9:
    error = 0;
    goto LABEL_10;
  }
  v11 = (void *)v10;
  v12 = [(NLGazetteer *)self initWithNLModel:v10 error:error];
LABEL_5:
  self = v12;

  error = (NSError **)self;
LABEL_10:

  return (NLGazetteer *)error;
}

- (NLGazetteer)initWithData:(NSData *)data error:(NSError *)error
{
  v22[1] = *MEMORY[0x1E4F143B8];
  v6 = data;
  id v18 = 0;
  uint64_t v21 = *MEMORY[0x1E4F5C7D8];
  v22[0] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];
  uint64_t v8 = NLGazetteerCreate();
  if (v8)
  {
    v9 = (void *)v8;
    v17.receiver = self;
    v17.super_class = (Class)NLGazetteer;
    uint64_t v10 = [(NLGazetteer *)&v17 init];
    if (v10) {
      v10->_gazetteer = v9;
    }
    self = v10;
    v11 = self;
  }
  else
  {
    v12 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v19 = *MEMORY[0x1E4F28568];
    v20 = @"Failed to load gazetteer data";
    v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v20 forKeys:&v19 count:1];
    *error = [v12 errorWithDomain:@"NLNaturalLanguageErrorDomain" code:5 userInfo:v13];

    uint64_t v14 = +[NLModel modelWithData:v6 error:error];
    if (v14)
    {
      v15 = (void *)v14;
      self = [(NLGazetteer *)self initWithNLModel:v14 error:error];

      v11 = self;
    }
    else
    {
      v11 = 0;
    }
  }

  return v11;
}

- (void)_gazetteerRef
{
  return self->_gazetteer;
}

- (NLGazetteer)initWithNLModel:(id)a3 error:(id *)p_isa
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  uint64_t v8 = [v7 gazetteer];
  v9 = (const void *)[v8 _gazetteerRef];

  if (v9)
  {
    v14.receiver = self;
    v14.super_class = (Class)NLGazetteer;
    uint64_t v10 = [(NLGazetteer *)&v14 init];
    if (v10)
    {
      v10->_gazetteer = (void *)CFRetain(v9);
      objc_storeStrong((id *)&v10->_nlModel, a3);
    }
    self = v10;
    p_isa = (id *)&self->super.isa;
  }
  else if (p_isa)
  {
    v11 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v15 = *MEMORY[0x1E4F28568];
    v16[0] = @"Failed to load gazetteer file";
    v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
    *p_isa = [v11 errorWithDomain:@"NLNaturalLanguageErrorDomain" code:6 userInfo:v12];

    p_isa = 0;
  }

  return (NLGazetteer *)p_isa;
}

- (NLGazetteer)initWithMLModel:(id)a3 error:(id *)a4
{
  v6 = +[NLModel modelWithMLModel:error:](NLModel, "modelWithMLModel:error:", a3);
  if (v6)
  {
    self = [(NLGazetteer *)self initWithNLModel:v6 error:a4];
    id v7 = self;
  }
  else
  {
    id v7 = 0;
  }
  uint64_t v8 = v7;

  return v8;
}

- (NLGazetteer)initWithDictionary:(NSDictionary *)dictionary language:(NLLanguage)language error:(NSError *)error
{
  uint64_t v8 = dictionary;
  v9 = language;
  id v17 = 0;
  if (v9)
  {
    uint64_t v10 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:v9];
  }
  else
  {
    uint64_t v10 = 0;
  }
  v11 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", v8, *MEMORY[0x1E4F5C7E8], v10, *MEMORY[0x1E4F5C7F0], 0);
  uint64_t v12 = NLGazetteerCreate();
  if (v12)
  {
    v13 = (void *)v12;
    v16.receiver = self;
    v16.super_class = (Class)NLGazetteer;
    objc_super v14 = [(NLGazetteer *)&v16 init];
    self = v14;
    if (v14) {
      v14->_gazetteer = v13;
    }
  }
  else if (error)
  {
    *error = (NSError *)v17;
  }

  return self;
}

- (void)dealloc
{
  gazetteer = self->_gazetteer;
  if (gazetteer) {
    CFRelease(gazetteer);
  }
  v4.receiver = self;
  v4.super_class = (Class)NLGazetteer;
  [(NLGazetteer *)&v4 dealloc];
}

- (NSString)labelForString:(NSString *)string
{
  v3 = (void *)NLGazetteerCopyLabel();

  return (NSString *)v3;
}

- (id)labels
{
  v2 = (void *)NLGazetteerCopyAvailableLabels();

  return v2;
}

- (NSData)data
{
  v2 = (void *)NLGazetteerCopyCompressedModel();

  return (NSData *)v2;
}

+ (BOOL)writeGazetteerForDictionary:(NSDictionary *)dictionary language:(NLLanguage)language toURL:(NSURL *)url error:(NSError *)error
{
  v9 = url;
  uint64_t v10 = language;
  v11 = dictionary;
  uint64_t v12 = (void *)[objc_alloc((Class)objc_opt_class()) initWithDictionary:v11 language:v10 error:error];

  if (v12)
  {
    v13 = [v12 data];
    char v14 = [v13 writeToURL:v9 options:1 error:error];
  }
  else
  {
    char v14 = 0;
  }

  return v14;
}

- (id)modelDescription
{
  v2 = [(NLGazetteer *)self labels];
  v3 = v2;
  if (v2 && [v2 count])
  {
    objc_super v4 = NSString;
    id v5 = [v3 componentsJoinedByString:@","];
    v6 = [v4 stringWithFormat:@"This model is a gazetteer which tags words according to set {%@}", v5];
  }
  else
  {
    v6 = @"This model is a gazetteer";
  }

  return v6;
}

- (BOOL)writeMLModelToURL:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void *)MEMORY[0x1E4F1C9E8];
  v11 = [(NLGazetteer *)self language];
  uint64_t v12 = objc_msgSend(v10, "dictionaryWithObjectsAndKeys:", v11, @"Language", 0);
  v13 = +[NLModelConfiguration defaultModelConfigurationForType:0 options:v12 error:a5];

  char v14 = [[NLModelImplG alloc] initWithGazetteer:self];
  uint64_t v15 = [[NLModel alloc] initWithConfiguration:v13 modelImpl:v14];
  if (v15)
  {
    objc_super v16 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v9];
    uint64_t v17 = *MEMORY[0x1E4F1E8A0];
    id v18 = [v16 objectForKey:*MEMORY[0x1E4F1E8A0]];

    if (!v18)
    {
      uint64_t v19 = [(NLGazetteer *)self modelDescription];
      [v16 setObject:v19 forKey:v17];
    }
    BOOL v20 = [(NLModel *)v15 writeMLModelToURL:v8 options:v16 error:a5];
  }
  else if (a5)
  {
    [MEMORY[0x1E4F28C58] errorWithDomain:@"NLNaturalLanguageErrorDomain" code:6 userInfo:0];
    BOOL v20 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v20 = 0;
  }

  return v20;
}

+ (BOOL)writeGazetteerMLModelForDictionary:(id)a3 language:(id)a4 toURL:(id)a5 options:(id)a6 error:(id *)a7
{
  id v11 = a5;
  id v12 = a6;
  id v13 = a4;
  id v14 = a3;
  uint64_t v15 = (void *)[objc_alloc((Class)objc_opt_class()) initWithDictionary:v14 language:v13 error:a7];

  if (v15) {
    char v16 = [v15 writeMLModelToURL:v11 options:v12 error:a7];
  }
  else {
    char v16 = 0;
  }

  return v16;
}

- (void)_addImplementationToArray:(__CFArray *)a3
{
}

- (NLLanguage)language
{
  return (NLLanguage)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_language, 0);

  objc_storeStrong((id *)&self->_nlModel, 0);
}

@end