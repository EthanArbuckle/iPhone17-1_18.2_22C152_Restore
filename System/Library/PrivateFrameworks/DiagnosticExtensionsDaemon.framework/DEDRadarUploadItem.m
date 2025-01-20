@interface DEDRadarUploadItem
- (BOOL)isUploaded;
- (DEDRadarUploadItem)initWithUploadTask:(id)a3 andAttachment:(id)a4;
- (NSString)radarAttachmentName;
- (NSURL)radarURL;
- (id)description;
- (int64_t)totalBytesExpectedToSend;
- (int64_t)totalBytesSent;
- (unint64_t)taskIdentifier;
- (void)setIsUploaded:(BOOL)a3;
- (void)setRadarAttachmentName:(id)a3;
- (void)setRadarURL:(id)a3;
- (void)setTaskIdentifier:(unint64_t)a3;
- (void)setTotalBytesExpectedToSend:(int64_t)a3;
- (void)setTotalBytesSent:(int64_t)a3;
@end

@implementation DEDRadarUploadItem

- (DEDRadarUploadItem)initWithUploadTask:(id)a3 andAttachment:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)DEDRadarUploadItem;
  v8 = [(DEDRadarUploadItem *)&v14 init];
  if (v8)
  {
    -[DEDRadarUploadItem setTaskIdentifier:](v8, "setTaskIdentifier:", [v6 taskIdentifier]);
    [(DEDAttachmentItem *)v8 setAttachedPath:v7];
    [(DEDRadarUploadItem *)v8 setTotalBytesSent:0];
    v9 = [MEMORY[0x263F08850] defaultManager];
    v10 = [(DEDAttachmentItem *)v8 attachedPath];
    v11 = [v10 path];
    v12 = [v9 attributesOfItemAtPath:v11 error:0];
    -[DEDRadarUploadItem setTotalBytesExpectedToSend:](v8, "setTotalBytesExpectedToSend:", [v12 fileSize]);

    [(DEDRadarUploadItem *)v8 setIsUploaded:0];
  }

  return v8;
}

- (id)description
{
  v15[5] = *MEMORY[0x263EF8340];
  v14[0] = @"taskIdentifier";
  v3 = objc_msgSend(objc_alloc(NSNumber), "initWithInteger:", -[DEDRadarUploadItem taskIdentifier](self, "taskIdentifier"));
  v15[0] = v3;
  v14[1] = @"attachedPath";
  v4 = [(DEDAttachmentItem *)self attachedPath];
  v15[1] = v4;
  v14[2] = @"totalBytesSent";
  v5 = objc_msgSend(objc_alloc(NSNumber), "initWithLongLong:", -[DEDRadarUploadItem totalBytesSent](self, "totalBytesSent"));
  v15[2] = v5;
  v14[3] = @"totalBytesExpectedToSend";
  id v6 = objc_msgSend(objc_alloc(NSNumber), "initWithLongLong:", -[DEDRadarUploadItem totalBytesExpectedToSend](self, "totalBytesExpectedToSend"));
  v15[3] = v6;
  v14[4] = @"isUploaded";
  id v7 = objc_msgSend([NSString alloc], "initWithFormat:", @"%d", -[DEDRadarUploadItem isUploaded](self, "isUploaded"));
  v15[4] = v7;
  v8 = [NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:5];

  v9 = NSString;
  v10 = (objc_class *)objc_opt_class();
  v11 = NSStringFromClass(v10);
  v12 = [v9 stringWithFormat:@"%@: %@", v11, v8];

  return v12;
}

- (unint64_t)taskIdentifier
{
  return self->_taskIdentifier;
}

- (void)setTaskIdentifier:(unint64_t)a3
{
  self->_taskIdentifier = a3;
}

- (int64_t)totalBytesSent
{
  return self->_totalBytesSent;
}

- (void)setTotalBytesSent:(int64_t)a3
{
  self->_totalBytesSent = a3;
}

- (int64_t)totalBytesExpectedToSend
{
  return self->_totalBytesExpectedToSend;
}

- (void)setTotalBytesExpectedToSend:(int64_t)a3
{
  self->_totalBytesExpectedToSend = a3;
}

- (BOOL)isUploaded
{
  return self->_isUploaded;
}

- (void)setIsUploaded:(BOOL)a3
{
  self->_isUploaded = a3;
}

- (NSString)radarAttachmentName
{
  return self->_radarAttachmentName;
}

- (void)setRadarAttachmentName:(id)a3
{
}

- (NSURL)radarURL
{
  return self->_radarURL;
}

- (void)setRadarURL:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_radarURL, 0);
  objc_storeStrong((id *)&self->_radarAttachmentName, 0);
}

@end