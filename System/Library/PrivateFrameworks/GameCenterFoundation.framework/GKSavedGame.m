@interface GKSavedGame
- (NSDate)modificationDate;
- (NSString)deviceName;
- (NSString)name;
- (NSURL)fileURL;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)loadDataWithCompletionHandler:(void *)handler;
- (void)setDeviceName:(id)a3;
- (void)setFileURL:(id)a3;
- (void)setModificationDate:(id)a3;
- (void)setName:(id)a3;
@end

@implementation GKSavedGame

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = v4;
  if (v4)
  {
    [v4 setName:self->_name];
    [v5 setDeviceName:self->_deviceName];
    [v5 setModificationDate:self->_modificationDate];
    [v5 setFileURL:self->_fileURL];
  }
  return v5;
}

- (void)loadDataWithCompletionHandler:(void *)handler
{
  id v4 = handler;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __45__GKSavedGame_loadDataWithCompletionHandler___block_invoke;
  v6[3] = &unk_1E646E198;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __45__GKSavedGame_loadDataWithCompletionHandler___block_invoke(uint64_t a1)
{
  id v2 = +[GKSavedGameManager sharedManager];
  [v2 loadDataForSavedGame:*(void *)(a1 + 32) completionHandler:*(void *)(a1 + 40)];
}

- (id)description
{
  v6.receiver = self;
  v6.super_class = (Class)GKSavedGame;
  v3 = [(GKSavedGame *)&v6 description];
  id v4 = [v3 stringByAppendingFormat:@", name = %@, deviceName = %@, modificationDate = %@", self->_name, self->_deviceName, self->_modificationDate];

  return v4;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setName:(id)a3
{
}

- (NSString)deviceName
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDeviceName:(id)a3
{
}

- (NSDate)modificationDate
{
  return (NSDate *)objc_getProperty(self, a2, 24, 1);
}

- (void)setModificationDate:(id)a3
{
}

- (NSURL)fileURL
{
  return (NSURL *)objc_getProperty(self, a2, 32, 1);
}

- (void)setFileURL:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileURL, 0);
  objc_storeStrong((id *)&self->_modificationDate, 0);
  objc_storeStrong((id *)&self->_deviceName, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end