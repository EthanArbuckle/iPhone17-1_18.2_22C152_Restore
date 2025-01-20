@interface EDAttachmentMetadata
- (EDAttachmentMetadata)initWithAttachmentHash:(id)a3 nameOnDisk:(id)a4 size:(id)a5 downloadDate:(id)a6;
- (EDAttachmentMetadata)initWithAttachmentID:(id)a3 attachmentHash:(id)a4 nameOnDisk:(id)a5 size:(id)a6 downloadDate:(id)a7 viewCount:(id)a8 lastViewed:(id)a9 viewCountByTapped:(id)a10;
- (EDAttachmentMetadata)initWithAttachmentID:(id)a3 nameOnDisk:(id)a4;
- (NSDate)downloadDate;
- (NSDate)lastViewed;
- (NSNumber)attachmentID;
- (NSNumber)size;
- (NSNumber)viewCount;
- (NSNumber)viewCountByTapped;
- (NSString)attachmentHash;
- (NSString)nameOnDisk;
- (id)description;
- (void)setAttachmentID:(id)a3;
@end

@implementation EDAttachmentMetadata

- (EDAttachmentMetadata)initWithAttachmentID:(id)a3 attachmentHash:(id)a4 nameOnDisk:(id)a5 size:(id)a6 downloadDate:(id)a7 viewCount:(id)a8 lastViewed:(id)a9 viewCountByTapped:(id)a10
{
  id v27 = a3;
  id v26 = a4;
  id v25 = a5;
  id v24 = a6;
  id v23 = a7;
  id v22 = a8;
  id v21 = a9;
  id v17 = a10;
  v28.receiver = self;
  v28.super_class = (Class)EDAttachmentMetadata;
  v18 = [(EDAttachmentMetadata *)&v28 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_attachmentID, a3);
    objc_storeStrong((id *)&v19->_attachmentHash, a4);
    objc_storeStrong((id *)&v19->_nameOnDisk, a5);
    objc_storeStrong((id *)&v19->_size, a6);
    objc_storeStrong((id *)&v19->_downloadDate, a7);
    objc_storeStrong((id *)&v19->_viewCount, a8);
    objc_storeStrong((id *)&v19->_lastViewed, a9);
    objc_storeStrong((id *)&v19->_viewCountByTapped, a10);
  }

  return v19;
}

- (EDAttachmentMetadata)initWithAttachmentHash:(id)a3 nameOnDisk:(id)a4 size:(id)a5 downloadDate:(id)a6
{
  return [(EDAttachmentMetadata *)self initWithAttachmentID:0 attachmentHash:a3 nameOnDisk:a4 size:a5 downloadDate:a6 viewCount:0 lastViewed:0 viewCountByTapped:0];
}

- (EDAttachmentMetadata)initWithAttachmentID:(id)a3 nameOnDisk:(id)a4
{
  return [(EDAttachmentMetadata *)self initWithAttachmentID:a3 attachmentHash:0 nameOnDisk:a4 size:0 downloadDate:0 viewCount:0 lastViewed:0 viewCountByTapped:0];
}

- (id)description
{
  v30[8] = *MEMORY[0x1E4F143B8];
  v3 = NSString;
  v29 = [(EDAttachmentMetadata *)self attachmentID];
  objc_super v28 = [v3 stringWithFormat:@"attachmentID: %@", v29];
  v30[0] = v28;
  v4 = NSString;
  id v27 = [(EDAttachmentMetadata *)self attachmentHash];
  id v26 = [v4 stringWithFormat:@"attachmentHash: %@", v27];
  v30[1] = v26;
  v5 = NSString;
  id v25 = [(EDAttachmentMetadata *)self nameOnDisk];
  id v24 = [v5 stringWithFormat:@"nameOnDisk: %@", v25];
  v30[2] = v24;
  v6 = NSString;
  id v23 = [(EDAttachmentMetadata *)self downloadDate];
  v7 = [v6 stringWithFormat:@"downloadDate: %@", v23];
  v30[3] = v7;
  v8 = NSString;
  v9 = [(EDAttachmentMetadata *)self size];
  v10 = [v8 stringWithFormat:@"size: %@", v9];
  v30[4] = v10;
  v11 = NSString;
  v12 = [(EDAttachmentMetadata *)self viewCount];
  v13 = [v11 stringWithFormat:@"viewCount: %@", v12];
  v30[5] = v13;
  v14 = NSString;
  v15 = [(EDAttachmentMetadata *)self lastViewed];
  v16 = [v14 stringWithFormat:@"lastViewed: %@", v15];
  v30[6] = v16;
  id v17 = NSString;
  v18 = [(EDAttachmentMetadata *)self viewCountByTapped];
  v19 = [v17 stringWithFormat:@"viewCountByTapped: %@", v18];
  v30[7] = v19;
  v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:8];

  id v21 = [v20 componentsJoinedByString:@"\n"];

  return v21;
}

- (NSNumber)attachmentID
{
  return self->_attachmentID;
}

- (void)setAttachmentID:(id)a3
{
}

- (NSString)attachmentHash
{
  return self->_attachmentHash;
}

- (NSString)nameOnDisk
{
  return self->_nameOnDisk;
}

- (NSNumber)size
{
  return self->_size;
}

- (NSDate)downloadDate
{
  return self->_downloadDate;
}

- (NSNumber)viewCount
{
  return self->_viewCount;
}

- (NSDate)lastViewed
{
  return self->_lastViewed;
}

- (NSNumber)viewCountByTapped
{
  return self->_viewCountByTapped;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewCountByTapped, 0);
  objc_storeStrong((id *)&self->_lastViewed, 0);
  objc_storeStrong((id *)&self->_viewCount, 0);
  objc_storeStrong((id *)&self->_downloadDate, 0);
  objc_storeStrong((id *)&self->_size, 0);
  objc_storeStrong((id *)&self->_nameOnDisk, 0);
  objc_storeStrong((id *)&self->_attachmentHash, 0);

  objc_storeStrong((id *)&self->_attachmentID, 0);
}

@end