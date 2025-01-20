@interface CCMergeableDeltaFileTransferMessageMetadata
+ (id)mergeableDeltaFileTransferMessageMetadataFromPeerToPeerMessage:(id)a3 set:(id)a4 mergeableDeltaMetadataVectors:(id)a5 fileFormatVersion:(unint64_t)a6 peerPublicKey:(id)a7;
- (CCSet)set;
- (NSData)mergeableDeltaMetadataVectors;
- (id)dictionaryRepresentation;
- (id)initFromDictionary:(id)a3;
- (unint64_t)fileFormatVersion;
- (void)setFileFormatVersion:(unint64_t)a3;
- (void)setMergeableDeltaMetadataVectors:(id)a3;
- (void)setSet:(id)a3;
@end

@implementation CCMergeableDeltaFileTransferMessageMetadata

+ (id)mergeableDeltaFileTransferMessageMetadataFromPeerToPeerMessage:(id)a3 set:(id)a4 mergeableDeltaMetadataVectors:(id)a5 fileFormatVersion:(unint64_t)a6 peerPublicKey:(id)a7
{
  id v11 = a7;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  v15 = [CCMergeableDeltaFileTransferMessageMetadata alloc];
  v16 = [v14 device];
  uint64_t v17 = [v14 protocolVersion];
  [v14 walltime];
  double v19 = v18;
  v20 = [v14 peerPublicKey];

  v21 = [(CCPeerToPeerMessage *)v15 initWithDevice:v16 protocolVersion:v17 wallTime:v20 peerPublicKey:v19];
  [(CCMergeableDeltaFileTransferMessageMetadata *)v21 setSet:v13];

  [(CCMergeableDeltaFileTransferMessageMetadata *)v21 setMergeableDeltaMetadataVectors:v12];
  [(CCMergeableDeltaFileTransferMessageMetadata *)v21 setFileFormatVersion:a6];
  [(CCPeerToPeerMessage *)v21 setPeerPublicKey:v11];

  return v21;
}

- (id)initFromDictionary:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CCMergeableDeltaFileTransferMessageMetadata;
  v5 = [(CCPeerToPeerMessage *)&v17 initFromDictionary:v4];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"itemType"];
    unsigned __int16 v7 = [v6 integerValue];

    v8 = [MEMORY[0x263F29E78] currentPersonaIdentifier];
    id v9 = objc_alloc(MEMORY[0x263F31770]);
    v10 = [v4 objectForKeyedSubscript:@"descriptors"];
    uint64_t v11 = [v9 initWithItemType:v7 personaIdentifier:v8 encodedDescriptors:v10 options:1 error:0];
    id v12 = (void *)v5[5];
    v5[5] = v11;

    id v13 = [v4 objectForKeyedSubscript:@"fileFormatVersion"];
    v5[6] = [v13 unsignedIntegerValue];

    uint64_t v14 = [v4 objectForKeyedSubscript:@"mergeableDeltaMetadataVectors"];
    v15 = (void *)v5[7];
    v5[7] = v14;
  }
  return v5;
}

- (id)dictionaryRepresentation
{
  v16[4] = *MEMORY[0x263EF8340];
  v15[0] = @"itemType";
  v3 = objc_msgSend(NSNumber, "numberWithUnsignedShort:", -[CCSet itemType](self->_set, "itemType"));
  v16[0] = v3;
  v15[1] = @"descriptors";
  id v4 = (void *)MEMORY[0x263F31798];
  v5 = [(CCSet *)self->_set descriptors];
  v6 = [v4 encodedStringFromDescriptors:v5 error:0];
  unsigned __int16 v7 = v6;
  if (!v6)
  {
    unsigned __int16 v7 = [MEMORY[0x263EFF9D0] null];
  }
  v16[1] = v7;
  v15[2] = @"fileFormatVersion";
  v8 = [NSNumber numberWithUnsignedInteger:self->_fileFormatVersion];
  v15[3] = @"mergeableDeltaMetadataVectors";
  mergeableDeltaMetadataVectors = self->_mergeableDeltaMetadataVectors;
  v16[2] = v8;
  v16[3] = mergeableDeltaMetadataVectors;
  v10 = [NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:4];
  uint64_t v11 = (void *)[v10 mutableCopy];

  if (!v6) {
  v14.receiver = self;
  }
  v14.super_class = (Class)CCMergeableDeltaFileTransferMessageMetadata;
  id v12 = [(CCPeerToPeerMessage *)&v14 dictionaryRepresentation];
  [v11 addEntriesFromDictionary:v12];

  return v11;
}

- (CCSet)set
{
  return self->_set;
}

- (void)setSet:(id)a3
{
}

- (unint64_t)fileFormatVersion
{
  return self->_fileFormatVersion;
}

- (void)setFileFormatVersion:(unint64_t)a3
{
  self->_fileFormatVersion = a3;
}

- (NSData)mergeableDeltaMetadataVectors
{
  return self->_mergeableDeltaMetadataVectors;
}

- (void)setMergeableDeltaMetadataVectors:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mergeableDeltaMetadataVectors, 0);
  objc_storeStrong((id *)&self->_set, 0);
}

@end