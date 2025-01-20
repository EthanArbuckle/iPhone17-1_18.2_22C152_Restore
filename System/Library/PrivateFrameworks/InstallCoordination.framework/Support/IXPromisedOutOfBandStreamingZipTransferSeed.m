@interface IXPromisedOutOfBandStreamingZipTransferSeed
+ (BOOL)supportsSecureCoding;
- (IXPromisedOutOfBandStreamingZipTransferSeed)initWithCoder:(id)a3;
- (NSDictionary)szOptions;
- (NSURL)extractionPath;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)archiveBytesConsumed;
- (unint64_t)archiveSizeBytes;
- (void)encodeWithCoder:(id)a3;
- (void)setArchiveBytesConsumed:(unint64_t)a3;
- (void)setArchiveSizeBytes:(unint64_t)a3;
- (void)setExtractionPath:(id)a3;
- (void)setSzOptions:(id)a3;
@end

@implementation IXPromisedOutOfBandStreamingZipTransferSeed

- (IXPromisedOutOfBandStreamingZipTransferSeed)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)IXPromisedOutOfBandStreamingZipTransferSeed;
  v5 = [(IXOpaqueDataPromiseSeed *)&v13 initWithCoder:v4];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"archiveBytesConsumed"];
    v5->_archiveBytesConsumed = (unint64_t)[v6 unsignedLongLongValue];

    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"archiveSizeBytes"];
    v5->_archiveSizeBytes = (unint64_t)[v7 unsignedLongLongValue];

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"extractionPath"];
    extractionPath = v5->_extractionPath;
    v5->_extractionPath = (NSURL *)v8;

    uint64_t v10 = [v4 decodePropertyListForKey:@"szOptions"];
    szOptions = v5->_szOptions;
    v5->_szOptions = (NSDictionary *)v10;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)IXPromisedOutOfBandStreamingZipTransferSeed;
  id v4 = a3;
  [(IXOpaqueDataPromiseSeed *)&v9 encodeWithCoder:v4];
  v5 = +[NSNumber numberWithUnsignedLongLong:[(IXPromisedOutOfBandStreamingZipTransferSeed *)self archiveBytesConsumed]];
  [v4 encodeObject:v5 forKey:@"archiveBytesConsumed"];

  v6 = +[NSNumber numberWithUnsignedLongLong:[(IXPromisedOutOfBandStreamingZipTransferSeed *)self archiveSizeBytes]];
  [v4 encodeObject:v6 forKey:@"archiveSizeBytes"];

  v7 = [(IXPromisedOutOfBandStreamingZipTransferSeed *)self extractionPath];
  [v4 encodeObject:v7 forKey:@"extractionPath"];

  uint64_t v8 = [(IXPromisedOutOfBandStreamingZipTransferSeed *)self szOptions];
  [v4 encodeObject:v8 forKey:@"szOptions"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)IXPromisedOutOfBandStreamingZipTransferSeed;
  id v4 = [(IXOpaqueDataPromiseSeed *)&v8 copyWithZone:a3];
  objc_msgSend(v4, "setArchiveBytesConsumed:", -[IXPromisedOutOfBandStreamingZipTransferSeed archiveBytesConsumed](self, "archiveBytesConsumed"));
  objc_msgSend(v4, "setArchiveSizeBytes:", -[IXPromisedOutOfBandStreamingZipTransferSeed archiveSizeBytes](self, "archiveSizeBytes"));
  v5 = [(IXPromisedOutOfBandStreamingZipTransferSeed *)self extractionPath];
  [v4 setExtractionPath:v5];

  v6 = [(IXPromisedOutOfBandStreamingZipTransferSeed *)self szOptions];
  [v4 setSzOptions:v6];

  return v4;
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

- (NSURL)extractionPath
{
  return self->_extractionPath;
}

- (void)setExtractionPath:(id)a3
{
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
  objc_storeStrong((id *)&self->_szOptions, 0);

  objc_storeStrong((id *)&self->_extractionPath, 0);
}

@end