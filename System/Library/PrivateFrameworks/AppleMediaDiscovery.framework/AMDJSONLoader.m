@interface AMDJSONLoader
- (AMDJSONLoader)initWithPath:(id)a3;
- (NSString)path;
- (id)loadDataFromFileForClass:(Class)a3;
- (void)setPath:(id)a3;
@end

@implementation AMDJSONLoader

- (AMDJSONLoader)initWithPath:(id)a3
{
  id v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = v9;
  id v9 = 0;
  v7.receiver = v3;
  v7.super_class = (Class)AMDJSONLoader;
  id v9 = [(AMDJSONLoader *)&v7 init];
  objc_storeStrong(&v9, v9);
  id v6 = (id)[MEMORY[0x263F08850] defaultManager];
  char v5 = 0;
  if (([v6 fileExistsAtPath:location[0] isDirectory:&v5] & 1) != 0 && (v5 & 1) == 0)
  {
    [v9 setPath:location[0]];
    v10 = (AMDJSONLoader *)v9;
  }
  else
  {
    v10 = 0;
  }
  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong(&v9, 0);
  return v10;
}

- (id)loadDataFromFileForClass:(Class)a3
{
  v23 = self;
  v22[2] = (id)a2;
  v22[1] = a3;
  location = v22;
  v22[0] = 0;
  id v13 = (id)MEMORY[0x263EFF8F8];
  v16 = [(AMDJSONLoader *)self path];
  id v20 = v22[0];
  id v15 = (id)objc_msgSend(v13, "dataWithContentsOfFile:options:error:");
  objc_storeStrong(v22, v20);
  id v21 = v15;

  if (v22[0])
  {
    id v12 = [(AMDJSONLoader *)v23 path];
    id v11 = (id)[v22[0] localizedDescription];
    NSLog(&cfstr_ErrorReadingFi.isa, v12, v11);

    id v24 = 0;
    int v19 = 1;
  }
  else
  {
    id v9 = v22;
    id v17 = 0;
    id v10 = (id)[MEMORY[0x263F08900] JSONObjectWithData:v21 options:0 error:&v17];
    objc_storeStrong(v22, v17);
    id v18 = v10;
    if (v22[0])
    {
      id v8 = [(AMDJSONLoader *)v23 path];
      id v7 = (id)[v22[0] localizedDescription];
      NSLog(&cfstr_ErrorParsingDa.isa, v8, v7);

      id v24 = 0;
      int v19 = 1;
    }
    else if (v18 && (objc_opt_isKindOfClass() & 1) != 0)
    {
      id v24 = v18;
      int v19 = 1;
    }
    else
    {
      id v6 = [(AMDJSONLoader *)v23 path];
      NSLog(&cfstr_DataFromFileIs.isa, v6);

      id v24 = 0;
      int v19 = 1;
    }
    objc_storeStrong(&v18, 0);
  }
  id obj = 0;
  objc_storeStrong(&v21, 0);
  objc_storeStrong(v22, obj);
  id v3 = v24;

  return v3;
}

- (NSString)path
{
  return self->_path;
}

- (void)setPath:(id)a3
{
}

- (void).cxx_destruct
{
}

@end