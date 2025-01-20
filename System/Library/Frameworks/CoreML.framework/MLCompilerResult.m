@interface MLCompilerResult
+ (id)resultWithArchive:(void *)a3;
+ (id)resultWithOutputFiles:(id)a3;
- (NSArray)outputFiles;
- (void)setOutputFiles:(id)a3;
@end

@implementation MLCompilerResult

- (void).cxx_destruct
{
}

- (void)setOutputFiles:(id)a3
{
}

- (NSArray)outputFiles
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

+ (id)resultWithArchive:(void *)a3
{
  OArchive::listFilesWritten((OArchive *)&v11, (uint64_t)a3);
  v3 = [MEMORY[0x1E4F1CA48] array];
  v4 = v11;
  for (i = v12; v4 != i; v4 += 3)
  {
    v6 = v4;
    if (*((char *)v4 + 23) < 0) {
      v6 = (uint64_t *)*v4;
    }
    v7 = [NSString stringWithUTF8String:v6];
    v8 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v7];
    if (v8) {
      [v3 addObject:v8];
    }
  }
  v9 = +[MLCompilerResult resultWithOutputFiles:v3];

  v13 = (void **)&v11;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&v13);

  return v9;
}

+ (id)resultWithOutputFiles:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)a1);
  [v5 setOutputFiles:v4];

  return v5;
}

@end