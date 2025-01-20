@interface BDSSimpleDataFile
- (BDSSimpleDataFile)initWithURL:(id)a3;
- (BOOL)remove:(id *)a3;
- (BOOL)save:(id)a3 error:(id *)a4;
- (NSURL)url;
- (id)load:(id *)a3;
@end

@implementation BDSSimpleDataFile

- (BDSSimpleDataFile)initWithURL:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BDSSimpleDataFile;
  v6 = [(BDSSimpleDataFile *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_url, a3);
  }

  return v7;
}

- (id)load:(id *)a3
{
  v3 = [(BDSSimpleDataFile *)self url];
  v4 = +[NSData dataWithContentsOfURL:v3];

  return v4;
}

- (BOOL)save:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [(BDSSimpleDataFile *)self url];
  id v11 = 0;
  unsigned __int8 v8 = [v6 writeToURL:v7 options:1073741825 error:&v11];

  id v9 = v11;
  if (a4 && v9) {
    *a4 = v9;
  }

  return v8;
}

- (BOOL)remove:(id *)a3
{
  id v5 = +[NSFileManager defaultManager];
  id v6 = [(BDSSimpleDataFile *)self url];
  id v10 = 0;
  unsigned __int8 v7 = [v5 removeItemAtURL:v6 error:&v10];
  id v8 = v10;

  if (a3 && v8) {
    *a3 = v8;
  }

  return v7;
}

- (NSURL)url
{
  return self->_url;
}

- (void).cxx_destruct
{
}

@end