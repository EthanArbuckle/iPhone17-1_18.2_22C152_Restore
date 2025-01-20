@interface APVersionTestData
- (APVersionTestData)init;
- (NSArray)directoryURLs;
- (NSArray)testURLS;
- (id)subdirectoriesAtURL:(id)a3;
- (void)setDirectoryURLs:(id)a3;
- (void)setTestURLS:(id)a3;
@end

@implementation APVersionTestData

- (APVersionTestData)init
{
  v12.receiver = self;
  v12.super_class = (Class)APVersionTestData;
  v4 = [(APVersionTestData *)&v12 init];
  if (v4)
  {
    uint64_t v5 = objc_msgSend_array(MEMORY[0x263EFF8C0], v2, v3);
    testURLS = v4->_testURLS;
    v4->_testURLS = (NSArray *)v5;

    uint64_t v9 = objc_msgSend_array(MEMORY[0x263EFF8C0], v7, v8);
    directoryURLs = v4->_directoryURLs;
    v4->_directoryURLs = (NSArray *)v9;
  }
  return v4;
}

- (id)subdirectoriesAtURL:(id)a3
{
  id v4 = a3;
  uint64_t v7 = objc_msgSend_directoryURLs(self, v5, v6);
  if (v7
    && (v10 = (void *)v7,
        objc_msgSend_lastPathComponent(v4, v8, v9),
        v11 = objc_claimAutoreleasedReturnValue(),
        int isEqualToString = objc_msgSend_isEqualToString_(v11, v12, @"APCS"),
        v11,
        v10,
        isEqualToString))
  {
    uint64_t v14 = objc_msgSend_directoryURLs(self, v8, v9);
  }
  else
  {
    uint64_t v14 = objc_msgSend_testURLS(self, v8, v9);
  }
  v15 = (void *)v14;

  return v15;
}

- (void)setTestURLS:(id)a3
{
}

- (void)setDirectoryURLs:(id)a3
{
}

- (NSArray)testURLS
{
  return self->_testURLS;
}

- (NSArray)directoryURLs
{
  return self->_directoryURLs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_directoryURLs, 0);
  objc_storeStrong((id *)&self->_testURLS, 0);
}

@end