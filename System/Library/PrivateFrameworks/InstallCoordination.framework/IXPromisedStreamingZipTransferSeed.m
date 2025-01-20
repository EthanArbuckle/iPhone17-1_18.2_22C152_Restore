@interface IXPromisedStreamingZipTransferSeed
+ (BOOL)supportsSecureCoding;
- (Class)clientPromiseClass;
- (IXPromisedStreamingZipTransferSeed)initWithCoder:(id)a3;
- (NSDictionary)szOptions;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)archiveBytesConsumed;
- (unint64_t)archiveSizeBytes;
- (void)encodeWithCoder:(id)a3;
- (void)setArchiveBytesConsumed:(unint64_t)a3;
- (void)setArchiveSizeBytes:(unint64_t)a3;
- (void)setSzOptions:(id)a3;
@end

@implementation IXPromisedStreamingZipTransferSeed

- (IXPromisedStreamingZipTransferSeed)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)IXPromisedStreamingZipTransferSeed;
  v5 = [(IXOwnedDataPromiseSeed *)&v11 initWithCoder:v4];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"archiveBytesConsumed"];
    v5->_archiveBytesConsumed = [v6 unsignedLongLongValue];

    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"archiveSizeBytes"];
    v5->_archiveSizeBytes = [v7 unsignedLongLongValue];

    uint64_t v8 = [v4 decodePropertyListForKey:@"szOptions"];
    szOptions = v5->_szOptions;
    v5->_szOptions = (NSDictionary *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)IXPromisedStreamingZipTransferSeed;
  id v4 = a3;
  [(IXOwnedDataPromiseSeed *)&v8 encodeWithCoder:v4];
  v5 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[IXPromisedStreamingZipTransferSeed archiveBytesConsumed](self, "archiveBytesConsumed", v8.receiver, v8.super_class));
  [v4 encodeObject:v5 forKey:@"archiveBytesConsumed"];

  v6 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[IXPromisedStreamingZipTransferSeed archiveSizeBytes](self, "archiveSizeBytes"));
  [v4 encodeObject:v6 forKey:@"archiveSizeBytes"];

  v7 = [(IXPromisedStreamingZipTransferSeed *)self szOptions];
  [v4 encodeObject:v7 forKey:@"szOptions"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)IXPromisedStreamingZipTransferSeed;
  id v4 = [(IXOwnedDataPromiseSeed *)&v7 copyWithZone:a3];
  objc_msgSend(v4, "setArchiveBytesConsumed:", -[IXPromisedStreamingZipTransferSeed archiveBytesConsumed](self, "archiveBytesConsumed"));
  objc_msgSend(v4, "setArchiveSizeBytes:", -[IXPromisedStreamingZipTransferSeed archiveSizeBytes](self, "archiveSizeBytes"));
  v5 = [(IXPromisedStreamingZipTransferSeed *)self szOptions];
  [v4 setSzOptions:v5];

  return v4;
}

- (Class)clientPromiseClass
{
  return (Class)objc_opt_class();
}

- (unint64_t)archiveBytesConsumed
{
  return self->_archiveBytesConsumed;
}

- (void)setArchiveBytesConsumed:(unint64_t)a3
{
  self->_archiveBytesConsumed = a3;
}

- (unint64_t)archiveSizeBytes
{
  return self->_archiveSizeBytes;
}

- (void)setArchiveSizeBytes:(unint64_t)a3
{
  self->_archiveSizeBytes = a3;
}

- (NSDictionary)szOptions
{
  return self->_szOptions;
}

- (void)setSzOptions:(id)a3
{
}

- (void).cxx_destruct
{
}

@end