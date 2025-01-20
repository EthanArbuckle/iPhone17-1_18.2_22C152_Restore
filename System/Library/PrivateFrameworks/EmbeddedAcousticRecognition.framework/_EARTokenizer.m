@interface _EARTokenizer
+ (void)initialize;
- (_EARTokenizer)initWithNcsRoot:(id)a3;
- (id)tokenize:(id)a3;
- (id)tokenize:(id)a3 limit:(unint64_t)a4;
@end

@implementation _EARTokenizer

+ (void)initialize
{
  v3 = (EARLogger *)objc_opt_class();
  if (v3 == a1)
  {
    EARLogger::initializeLogging(v3);
  }
}

- (_EARTokenizer)initWithNcsRoot:(id)a3
{
  id v4 = a3;
  v5 = [(_EARQuasarTokenizer *)[_EARSdapiTokenizer alloc] initWithNcsRoot:v4];

  return &v5->super.super;
}

- (id)tokenize:(id)a3
{
  v6[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v6[0] = v3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];

  return v4;
}

- (id)tokenize:(id)a3 limit:(unint64_t)a4
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = v5;
  if (a4)
  {
    v9[0] = v5;
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  }
  else
  {
    v7 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v7;
}

@end