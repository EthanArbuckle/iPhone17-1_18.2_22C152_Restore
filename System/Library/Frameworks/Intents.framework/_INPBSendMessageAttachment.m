@interface _INPBSendMessageAttachment
+ (BOOL)supportsSecureCoding;
- (BOOL)currentLocation;
- (BOOL)hasAudioMessageFile;
- (BOOL)hasAudioMessageFileURL;
- (BOOL)hasCurrentLocation;
- (BOOL)hasFile;
- (BOOL)hasFileURL;
- (BOOL)hasPhAssetId;
- (BOOL)hasSharedLink;
- (BOOL)hasSpeechDataURL;
- (BOOL)hasTypeIdentifier;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)phAssetId;
- (NSString)typeIdentifier;
- (_INPBFileDataAttachment)audioMessageFile;
- (_INPBFileDataAttachment)file;
- (_INPBSendMessageAttachment)initWithCoder:(id)a3;
- (_INPBURLValue)audioMessageFileURL;
- (_INPBURLValue)fileURL;
- (_INPBURLValue)sharedLink;
- (_INPBURLValue)speechDataURL;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)whichDatasource;
- (void)encodeWithCoder:(id)a3;
- (void)setAudioMessageFile:(id)a3;
- (void)setAudioMessageFileURL:(id)a3;
- (void)setCurrentLocation:(BOOL)a3;
- (void)setFile:(id)a3;
- (void)setFileURL:(id)a3;
- (void)setPhAssetId:(id)a3;
- (void)setSharedLink:(id)a3;
- (void)setSpeechDataURL:(id)a3;
- (void)setTypeIdentifier:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBSendMessageAttachment

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_typeIdentifier, 0);
  objc_storeStrong((id *)&self->_speechDataURL, 0);
  objc_storeStrong((id *)&self->_sharedLink, 0);
  objc_storeStrong((id *)&self->_phAssetId, 0);
  objc_storeStrong((id *)&self->_fileURL, 0);
  objc_storeStrong((id *)&self->_file, 0);
  objc_storeStrong((id *)&self->_audioMessageFileURL, 0);

  objc_storeStrong((id *)&self->_audioMessageFile, 0);
}

- (unint64_t)whichDatasource
{
  return self->_whichDatasource;
}

- (NSString)typeIdentifier
{
  return self->_typeIdentifier;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [(_INPBSendMessageAttachment *)self audioMessageFile];
  v5 = [v4 dictionaryRepresentation];
  [v3 setObject:v5 forKeyedSubscript:@"audioMessageFile"];

  v6 = [(_INPBSendMessageAttachment *)self audioMessageFileURL];
  v7 = [v6 dictionaryRepresentation];
  [v3 setObject:v7 forKeyedSubscript:@"audioMessageFileURL"];

  if ([(_INPBSendMessageAttachment *)self hasCurrentLocation])
  {
    v8 = objc_msgSend(NSNumber, "numberWithBool:", -[_INPBSendMessageAttachment currentLocation](self, "currentLocation"));
    [v3 setObject:v8 forKeyedSubscript:@"currentLocation"];
  }
  v9 = [(_INPBSendMessageAttachment *)self file];
  v10 = [v9 dictionaryRepresentation];
  [v3 setObject:v10 forKeyedSubscript:@"file"];

  v11 = [(_INPBSendMessageAttachment *)self fileURL];
  v12 = [v11 dictionaryRepresentation];
  [v3 setObject:v12 forKeyedSubscript:@"fileURL"];

  if (self->_phAssetId)
  {
    v13 = [(_INPBSendMessageAttachment *)self phAssetId];
    v14 = (void *)[v13 copy];
    [v3 setObject:v14 forKeyedSubscript:@"phAssetId"];
  }
  v15 = [(_INPBSendMessageAttachment *)self sharedLink];
  v16 = [v15 dictionaryRepresentation];
  [v3 setObject:v16 forKeyedSubscript:@"sharedLink"];

  v17 = [(_INPBSendMessageAttachment *)self speechDataURL];
  v18 = [v17 dictionaryRepresentation];
  [v3 setObject:v18 forKeyedSubscript:@"speechDataURL"];

  if (self->_typeIdentifier)
  {
    v19 = [(_INPBSendMessageAttachment *)self typeIdentifier];
    v20 = (void *)[v19 copy];
    [v3 setObject:v20 forKeyedSubscript:@"typeIdentifier"];
  }

  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(_INPBFileDataAttachment *)self->_audioMessageFile hash];
  unint64_t v4 = [(_INPBURLValue *)self->_audioMessageFileURL hash];
  if ([(_INPBSendMessageAttachment *)self hasCurrentLocation]) {
    uint64_t v5 = 2654435761 * self->_currentLocation;
  }
  else {
    uint64_t v5 = 0;
  }
  unint64_t v6 = v4 ^ v3 ^ v5 ^ [(_INPBFileDataAttachment *)self->_file hash];
  unint64_t v7 = [(_INPBURLValue *)self->_fileURL hash];
  NSUInteger v8 = v7 ^ [(NSString *)self->_phAssetId hash];
  unint64_t v9 = v6 ^ v8 ^ [(_INPBURLValue *)self->_sharedLink hash];
  unint64_t v10 = [(_INPBURLValue *)self->_speechDataURL hash];
  return v9 ^ v10 ^ [(NSString *)self->_typeIdentifier hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_46;
  }
  uint64_t v5 = [(_INPBSendMessageAttachment *)self audioMessageFile];
  unint64_t v6 = [v4 audioMessageFile];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_45;
  }
  uint64_t v7 = [(_INPBSendMessageAttachment *)self audioMessageFile];
  if (v7)
  {
    NSUInteger v8 = (void *)v7;
    unint64_t v9 = [(_INPBSendMessageAttachment *)self audioMessageFile];
    unint64_t v10 = [v4 audioMessageFile];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_46;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_INPBSendMessageAttachment *)self audioMessageFileURL];
  unint64_t v6 = [v4 audioMessageFileURL];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_45;
  }
  uint64_t v12 = [(_INPBSendMessageAttachment *)self audioMessageFileURL];
  if (v12)
  {
    v13 = (void *)v12;
    v14 = [(_INPBSendMessageAttachment *)self audioMessageFileURL];
    v15 = [v4 audioMessageFileURL];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_46;
    }
  }
  else
  {
  }
  int v17 = [(_INPBSendMessageAttachment *)self hasCurrentLocation];
  if (v17 != [v4 hasCurrentLocation]) {
    goto LABEL_46;
  }
  if ([(_INPBSendMessageAttachment *)self hasCurrentLocation])
  {
    if ([v4 hasCurrentLocation])
    {
      int currentLocation = self->_currentLocation;
      if (currentLocation != [v4 currentLocation]) {
        goto LABEL_46;
      }
    }
  }
  uint64_t v5 = [(_INPBSendMessageAttachment *)self file];
  unint64_t v6 = [v4 file];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_45;
  }
  uint64_t v19 = [(_INPBSendMessageAttachment *)self file];
  if (v19)
  {
    v20 = (void *)v19;
    v21 = [(_INPBSendMessageAttachment *)self file];
    v22 = [v4 file];
    int v23 = [v21 isEqual:v22];

    if (!v23) {
      goto LABEL_46;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_INPBSendMessageAttachment *)self fileURL];
  unint64_t v6 = [v4 fileURL];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_45;
  }
  uint64_t v24 = [(_INPBSendMessageAttachment *)self fileURL];
  if (v24)
  {
    v25 = (void *)v24;
    v26 = [(_INPBSendMessageAttachment *)self fileURL];
    v27 = [v4 fileURL];
    int v28 = [v26 isEqual:v27];

    if (!v28) {
      goto LABEL_46;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_INPBSendMessageAttachment *)self phAssetId];
  unint64_t v6 = [v4 phAssetId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_45;
  }
  uint64_t v29 = [(_INPBSendMessageAttachment *)self phAssetId];
  if (v29)
  {
    v30 = (void *)v29;
    v31 = [(_INPBSendMessageAttachment *)self phAssetId];
    v32 = [v4 phAssetId];
    int v33 = [v31 isEqual:v32];

    if (!v33) {
      goto LABEL_46;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_INPBSendMessageAttachment *)self sharedLink];
  unint64_t v6 = [v4 sharedLink];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_45;
  }
  uint64_t v34 = [(_INPBSendMessageAttachment *)self sharedLink];
  if (v34)
  {
    v35 = (void *)v34;
    v36 = [(_INPBSendMessageAttachment *)self sharedLink];
    v37 = [v4 sharedLink];
    int v38 = [v36 isEqual:v37];

    if (!v38) {
      goto LABEL_46;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_INPBSendMessageAttachment *)self speechDataURL];
  unint64_t v6 = [v4 speechDataURL];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_45;
  }
  uint64_t v39 = [(_INPBSendMessageAttachment *)self speechDataURL];
  if (v39)
  {
    v40 = (void *)v39;
    v41 = [(_INPBSendMessageAttachment *)self speechDataURL];
    v42 = [v4 speechDataURL];
    int v43 = [v41 isEqual:v42];

    if (!v43) {
      goto LABEL_46;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_INPBSendMessageAttachment *)self typeIdentifier];
  unint64_t v6 = [v4 typeIdentifier];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v44 = [(_INPBSendMessageAttachment *)self typeIdentifier];
    if (!v44)
    {

LABEL_49:
      BOOL v49 = 1;
      goto LABEL_47;
    }
    v45 = (void *)v44;
    v46 = [(_INPBSendMessageAttachment *)self typeIdentifier];
    v47 = [v4 typeIdentifier];
    char v48 = [v46 isEqual:v47];

    if (v48) {
      goto LABEL_49;
    }
  }
  else
  {
LABEL_45:
  }
LABEL_46:
  BOOL v49 = 0;
LABEL_47:

  return v49;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [+[_INPBSendMessageAttachment allocWithZone:](_INPBSendMessageAttachment, "allocWithZone:") init];
  id v6 = [(_INPBFileDataAttachment *)self->_audioMessageFile copyWithZone:a3];
  [(_INPBSendMessageAttachment *)v5 setAudioMessageFile:v6];

  id v7 = [(_INPBURLValue *)self->_audioMessageFileURL copyWithZone:a3];
  [(_INPBSendMessageAttachment *)v5 setAudioMessageFileURL:v7];

  if ([(_INPBSendMessageAttachment *)self hasCurrentLocation]) {
    [(_INPBSendMessageAttachment *)v5 setCurrentLocation:[(_INPBSendMessageAttachment *)self currentLocation]];
  }
  id v8 = [(_INPBFileDataAttachment *)self->_file copyWithZone:a3];
  [(_INPBSendMessageAttachment *)v5 setFile:v8];

  id v9 = [(_INPBURLValue *)self->_fileURL copyWithZone:a3];
  [(_INPBSendMessageAttachment *)v5 setFileURL:v9];

  unint64_t v10 = (void *)[(NSString *)self->_phAssetId copyWithZone:a3];
  [(_INPBSendMessageAttachment *)v5 setPhAssetId:v10];

  id v11 = [(_INPBURLValue *)self->_sharedLink copyWithZone:a3];
  [(_INPBSendMessageAttachment *)v5 setSharedLink:v11];

  id v12 = [(_INPBURLValue *)self->_speechDataURL copyWithZone:a3];
  [(_INPBSendMessageAttachment *)v5 setSpeechDataURL:v12];

  v13 = (void *)[(NSString *)self->_typeIdentifier copyWithZone:a3];
  [(_INPBSendMessageAttachment *)v5 setTypeIdentifier:v13];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBSendMessageAttachment *)self data];
  uint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBSendMessageAttachment)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBSendMessageAttachment *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        id v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBSendMessageAttachment *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBSendMessageAttachment *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  id v19 = a3;
  id v4 = [(_INPBSendMessageAttachment *)self audioMessageFile];

  if (v4)
  {
    uint64_t v5 = [(_INPBSendMessageAttachment *)self audioMessageFile];
    PBDataWriterWriteSubmessage();
  }
  id v6 = [(_INPBSendMessageAttachment *)self audioMessageFileURL];

  if (v6)
  {
    uint64_t v7 = [(_INPBSendMessageAttachment *)self audioMessageFileURL];
    PBDataWriterWriteSubmessage();
  }
  if ([(_INPBSendMessageAttachment *)self hasCurrentLocation]) {
    PBDataWriterWriteBOOLField();
  }
  id v8 = [(_INPBSendMessageAttachment *)self file];

  if (v8)
  {
    id v9 = [(_INPBSendMessageAttachment *)self file];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v10 = [(_INPBSendMessageAttachment *)self fileURL];

  if (v10)
  {
    id v11 = [(_INPBSendMessageAttachment *)self fileURL];
    PBDataWriterWriteSubmessage();
  }
  id v12 = [(_INPBSendMessageAttachment *)self phAssetId];

  if (v12) {
    PBDataWriterWriteStringField();
  }
  v13 = [(_INPBSendMessageAttachment *)self sharedLink];

  if (v13)
  {
    v14 = [(_INPBSendMessageAttachment *)self sharedLink];
    PBDataWriterWriteSubmessage();
  }
  v15 = [(_INPBSendMessageAttachment *)self speechDataURL];

  if (v15)
  {
    int v16 = [(_INPBSendMessageAttachment *)self speechDataURL];
    PBDataWriterWriteSubmessage();
  }
  int v17 = [(_INPBSendMessageAttachment *)self typeIdentifier];

  v18 = v19;
  if (v17)
  {
    PBDataWriterWriteStringField();
    v18 = v19;
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBSendMessageAttachmentReadFrom(self, (uint64_t)a3);
}

- (BOOL)hasTypeIdentifier
{
  return self->_typeIdentifier != 0;
}

- (void)setTypeIdentifier:(id)a3
{
  self->_typeIdentifier = (NSString *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (BOOL)hasSpeechDataURL
{
  return self->_whichDatasource == 4 && self->_speechDataURL != 0;
}

- (_INPBURLValue)speechDataURL
{
  if (self->_whichDatasource == 4) {
    v2 = self->_speechDataURL;
  }
  else {
    v2 = 0;
  }

  return v2;
}

- (void)setSpeechDataURL:(id)a3
{
  id v4 = (_INPBURLValue *)a3;
  file = self->_file;
  self->_file = 0;

  fileURL = self->_fileURL;
  self->_fileURL = 0;

  self->_int currentLocation = 0;
  audioMessageFile = self->_audioMessageFile;
  self->_audioMessageFile = 0;

  audioMessageFileURL = self->_audioMessageFileURL;
  self->_audioMessageFileURL = 0;

  sharedLink = self->_sharedLink;
  self->_sharedLink = 0;

  phAssetId = self->_phAssetId;
  self->_phAssetId = 0;

  self->_whichDatasource = 4 * (v4 != 0);
  speechDataURL = self->_speechDataURL;
  self->_speechDataURL = v4;
}

- (BOOL)hasSharedLink
{
  return self->_whichDatasource == 7 && self->_sharedLink != 0;
}

- (_INPBURLValue)sharedLink
{
  if (self->_whichDatasource == 7) {
    v2 = self->_sharedLink;
  }
  else {
    v2 = 0;
  }

  return v2;
}

- (void)setSharedLink:(id)a3
{
  id v4 = (_INPBURLValue *)a3;
  file = self->_file;
  self->_file = 0;

  fileURL = self->_fileURL;
  self->_fileURL = 0;

  self->_int currentLocation = 0;
  speechDataURL = self->_speechDataURL;
  self->_speechDataURL = 0;

  audioMessageFile = self->_audioMessageFile;
  self->_audioMessageFile = 0;

  audioMessageFileURL = self->_audioMessageFileURL;
  self->_audioMessageFileURL = 0;

  phAssetId = self->_phAssetId;
  self->_phAssetId = 0;

  unint64_t v11 = 7;
  if (!v4) {
    unint64_t v11 = 0;
  }
  self->_whichDatasource = v11;
  sharedLink = self->_sharedLink;
  self->_sharedLink = v4;
}

- (BOOL)hasPhAssetId
{
  return self->_whichDatasource == 8 && self->_phAssetId != 0;
}

- (NSString)phAssetId
{
  if (self->_whichDatasource == 8) {
    v2 = self->_phAssetId;
  }
  else {
    v2 = 0;
  }

  return v2;
}

- (void)setPhAssetId:(id)a3
{
  file = self->_file;
  self->_file = 0;
  id v12 = a3;

  fileURL = self->_fileURL;
  self->_fileURL = 0;

  self->_int currentLocation = 0;
  speechDataURL = self->_speechDataURL;
  self->_speechDataURL = 0;

  audioMessageFile = self->_audioMessageFile;
  self->_audioMessageFile = 0;

  audioMessageFileURL = self->_audioMessageFileURL;
  self->_audioMessageFileURL = 0;

  sharedLink = self->_sharedLink;
  self->_sharedLink = 0;

  self->_whichDatasource = 8 * (v12 != 0);
  unint64_t v10 = (NSString *)[v12 copy];
  phAssetId = self->_phAssetId;
  self->_phAssetId = v10;
}

- (BOOL)hasFileURL
{
  return self->_whichDatasource == 2 && self->_fileURL != 0;
}

- (_INPBURLValue)fileURL
{
  if (self->_whichDatasource == 2) {
    v2 = self->_fileURL;
  }
  else {
    v2 = 0;
  }

  return v2;
}

- (void)setFileURL:(id)a3
{
  id v4 = (_INPBURLValue *)a3;
  file = self->_file;
  self->_file = 0;

  self->_int currentLocation = 0;
  speechDataURL = self->_speechDataURL;
  self->_speechDataURL = 0;

  audioMessageFile = self->_audioMessageFile;
  self->_audioMessageFile = 0;

  audioMessageFileURL = self->_audioMessageFileURL;
  self->_audioMessageFileURL = 0;

  sharedLink = self->_sharedLink;
  self->_sharedLink = 0;

  phAssetId = self->_phAssetId;
  self->_phAssetId = 0;

  self->_whichDatasource = 2 * (v4 != 0);
  fileURL = self->_fileURL;
  self->_fileURL = v4;
}

- (BOOL)hasFile
{
  return self->_whichDatasource == 1 && self->_file != 0;
}

- (_INPBFileDataAttachment)file
{
  if (self->_whichDatasource == 1) {
    v2 = self->_file;
  }
  else {
    v2 = 0;
  }

  return v2;
}

- (void)setFile:(id)a3
{
  id v4 = (_INPBFileDataAttachment *)a3;
  fileURL = self->_fileURL;
  self->_fileURL = 0;

  self->_int currentLocation = 0;
  speechDataURL = self->_speechDataURL;
  self->_speechDataURL = 0;

  audioMessageFile = self->_audioMessageFile;
  self->_audioMessageFile = 0;

  audioMessageFileURL = self->_audioMessageFileURL;
  self->_audioMessageFileURL = 0;

  sharedLink = self->_sharedLink;
  self->_sharedLink = 0;

  phAssetId = self->_phAssetId;
  self->_phAssetId = 0;

  self->_whichDatasource = v4 != 0;
  file = self->_file;
  self->_file = v4;
}

- (BOOL)hasCurrentLocation
{
  return self->_whichDatasource == 3;
}

- (BOOL)currentLocation
{
  return self->_whichDatasource == 3 && self->_currentLocation;
}

- (void)setCurrentLocation:(BOOL)a3
{
  file = self->_file;
  self->_file = 0;

  fileURL = self->_fileURL;
  self->_fileURL = 0;

  speechDataURL = self->_speechDataURL;
  self->_speechDataURL = 0;

  audioMessageFile = self->_audioMessageFile;
  self->_audioMessageFile = 0;

  audioMessageFileURL = self->_audioMessageFileURL;
  self->_audioMessageFileURL = 0;

  sharedLink = self->_sharedLink;
  self->_sharedLink = 0;

  phAssetId = self->_phAssetId;
  self->_phAssetId = 0;

  self->_whichDatasource = 3;
  self->_int currentLocation = a3;
}

- (BOOL)hasAudioMessageFileURL
{
  return self->_whichDatasource == 6 && self->_audioMessageFileURL != 0;
}

- (_INPBURLValue)audioMessageFileURL
{
  if (self->_whichDatasource == 6) {
    v2 = self->_audioMessageFileURL;
  }
  else {
    v2 = 0;
  }

  return v2;
}

- (void)setAudioMessageFileURL:(id)a3
{
  id v4 = (_INPBURLValue *)a3;
  file = self->_file;
  self->_file = 0;

  fileURL = self->_fileURL;
  self->_fileURL = 0;

  self->_int currentLocation = 0;
  speechDataURL = self->_speechDataURL;
  self->_speechDataURL = 0;

  audioMessageFile = self->_audioMessageFile;
  self->_audioMessageFile = 0;

  sharedLink = self->_sharedLink;
  self->_sharedLink = 0;

  phAssetId = self->_phAssetId;
  self->_phAssetId = 0;

  unint64_t v11 = 6;
  if (!v4) {
    unint64_t v11 = 0;
  }
  self->_whichDatasource = v11;
  audioMessageFileURL = self->_audioMessageFileURL;
  self->_audioMessageFileURL = v4;
}

- (BOOL)hasAudioMessageFile
{
  return self->_whichDatasource == 5 && self->_audioMessageFile != 0;
}

- (_INPBFileDataAttachment)audioMessageFile
{
  if (self->_whichDatasource == 5) {
    v2 = self->_audioMessageFile;
  }
  else {
    v2 = 0;
  }

  return v2;
}

- (void)setAudioMessageFile:(id)a3
{
  id v4 = (_INPBFileDataAttachment *)a3;
  file = self->_file;
  self->_file = 0;

  fileURL = self->_fileURL;
  self->_fileURL = 0;

  self->_int currentLocation = 0;
  speechDataURL = self->_speechDataURL;
  self->_speechDataURL = 0;

  audioMessageFileURL = self->_audioMessageFileURL;
  self->_audioMessageFileURL = 0;

  sharedLink = self->_sharedLink;
  self->_sharedLink = 0;

  phAssetId = self->_phAssetId;
  self->_phAssetId = 0;

  unint64_t v11 = 5;
  if (!v4) {
    unint64_t v11 = 0;
  }
  self->_whichDatasource = v11;
  audioMessageFile = self->_audioMessageFile;
  self->_audioMessageFile = v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end