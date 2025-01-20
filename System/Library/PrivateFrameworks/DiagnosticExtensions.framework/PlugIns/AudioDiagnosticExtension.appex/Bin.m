@interface Bin
- (Bin)initWithFolderPath:(id)a3 startDate:(id)a4 endDate:(id)a5;
- (NSDate)end;
- (NSDate)start;
- (NSString)folderPath;
- (void)setEnd:(id)a3;
- (void)setFolderPath:(id)a3;
- (void)setStart:(id)a3;
@end

@implementation Bin

- (Bin)initWithFolderPath:(id)a3 startDate:(id)a4 endDate:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)Bin;
  v11 = [(Bin *)&v14 init];
  v12 = v11;
  if (v11)
  {
    [(Bin *)v11 setFolderPath:v8];
    [(Bin *)v12 setStart:v9];
    [(Bin *)v12 setEnd:v10];
  }

  return v12;
}

- (NSString)folderPath
{
  return self->_folderPath;
}

- (void)setFolderPath:(id)a3
{
}

- (NSDate)start
{
  return self->_start;
}

- (void)setStart:(id)a3
{
}

- (NSDate)end
{
  return self->_end;
}

- (void)setEnd:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_end, 0);
  objc_storeStrong((id *)&self->_start, 0);
  objc_storeStrong((id *)&self->_folderPath, 0);
}

@end