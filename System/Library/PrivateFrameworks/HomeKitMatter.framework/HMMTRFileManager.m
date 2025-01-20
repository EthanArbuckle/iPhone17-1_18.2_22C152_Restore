@interface HMMTRFileManager
- (BOOL)writeDictionary:(id)a3 toURL:(id)a4 error:(id *)a5;
- (id)dictionaryWithContentsOfURL:(id)a3 error:(id *)a4;
@end

@implementation HMMTRFileManager

- (BOOL)writeDictionary:(id)a3 toURL:(id)a4 error:(id *)a5
{
  id v7 = a4;
  v8 = [MEMORY[0x263F08AC0] dataWithPropertyList:a3 format:200 options:0 error:a5];
  v9 = v8;
  if (v8) {
    char v10 = [v8 writeToURL:v7 options:0 error:a5];
  }
  else {
    char v10 = 0;
  }

  return v10;
}

- (id)dictionaryWithContentsOfURL:(id)a3 error:(id *)a4
{
  return (id)[NSDictionary dictionaryWithContentsOfURL:a3 error:a4];
}

@end