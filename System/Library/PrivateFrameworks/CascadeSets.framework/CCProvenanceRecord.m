@interface CCProvenanceRecord
+ (id)genSQLCreateStatements;
+ (id)recordFromDatabaseValueRow:(id)a3;
+ (id)tableName;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToItemRecord:(id)a3;
- (CCProvenanceRecord)init;
- (CCProvenanceRecord)initWithDatabaseValueRow:(id)a3;
- (NSNumber)contentHash;
- (NSNumber)contentSequenceNumber;
- (NSNumber)contentSequenceNumberEndOfRun;
- (NSNumber)contentState;
- (NSNumber)deviceRowId;
- (NSNumber)instanceHash;
- (NSNumber)metaContentSequenceNumber;
- (NSNumber)metaContentSequenceNumberEndOfRun;
- (NSNumber)metaContentState;
- (NSNumber)provenanceRowId;
- (NSString)description;
- (unint64_t)hash;
@end

@implementation CCProvenanceRecord

- (CCProvenanceRecord)init
{
  id v2 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498] reason:@"init unsupported" userInfo:MEMORY[0x263EFFA78]];
  objc_exception_throw(v2);
}

+ (id)recordFromDatabaseValueRow:(id)a3
{
  id v3 = a3;
  v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithDatabaseValueRow:v3];

  return v4;
}

+ (id)genSQLCreateStatements
{
  v8[4] = *MEMORY[0x263EF8340];
  objc_msgSend(NSString, "stringWithFormat:", @"CREATE TABLE IF NOT EXISTS \"%@\" (\"%@\" integer PRIMARY KEY, \"%@\" integer NOT NULL, \"%@\" integer NULLABLE, \"%@\" integer NULLABLE, \"%@\" integer NOT NULL, \"%@\" integer NOT NULL, \"%@\" integer NULLABLE, \"%@\" integer NULLABLE, \"%@\" integer NULLABLE, \"%@\" integer NULLABLE, FOREIGN KEY (\"%@\") REFERENCES \"%@\" (\"%@\") ON UPDATE CASCADE ON DELETE CASCADE); ",
    @"provenance",
    @"provenance_row_id",
    @"device_row_id",
    @"instance_hash",
    @"content_hash",
    @"content_sequence_number",
    @"content_state",
    @"metacontent_sequence_number",
    @"metacontent_state",
    @"content_sequence_number_end_of_run",
    @"metacontent_sequence_number_end_of_run",
    @"device_row_id",
    @"device",
  id v2 = @"device_row_id");
  v8[0] = v2;
  objc_msgSend(NSString, "stringWithFormat:", @"CREATE INDEX \"%@\" ON \"%@\" (\"%@\",\"%@\",\"%@\");",
    @"idx_provenance_content_hash",
    @"provenance",
    @"content_hash",
    @"content_state",
  id v3 = @"device_row_id");
  v8[1] = v3;
  objc_msgSend(NSString, "stringWithFormat:", @"CREATE INDEX \"%@\" ON \"%@\" (\"%@\",\"%@\",\"%@\" DESC);",
    @"idx_provenance_content_sequence_number",
    @"provenance",
    @"device_row_id",
    @"content_state",
  v4 = @"content_sequence_number");
  v8[2] = v4;
  objc_msgSend(NSString, "stringWithFormat:", @"CREATE INDEX \"%@\" ON \"%@\" (\"%@\",\"%@\",\"%@\" DESC);",
    @"idx_provenance_metacontent_sequence_number",
    @"provenance",
    @"device_row_id",
    @"metacontent_state",
  v5 = @"metacontent_sequence_number");
  v8[3] = v5;
  v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:4];

  return v6;
}

+ (id)tableName
{
  return @"provenance";
}

- (CCProvenanceRecord)initWithDatabaseValueRow:(id)a3
{
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)CCProvenanceRecord;
  v5 = [(CCProvenanceRecord *)&v27 init];
  if (v5)
  {
    uint64_t v6 = [v4 numberValueAtColumnIndex:0];
    provenanceRowId = v5->_provenanceRowId;
    v5->_provenanceRowId = (NSNumber *)v6;

    uint64_t v8 = [v4 numberValueAtColumnIndex:1];
    deviceRowId = v5->_deviceRowId;
    v5->_deviceRowId = (NSNumber *)v8;

    uint64_t v10 = [v4 numberValueAtColumnIndex:2];
    instanceHash = v5->_instanceHash;
    v5->_instanceHash = (NSNumber *)v10;

    uint64_t v12 = [v4 numberValueAtColumnIndex:3];
    contentHash = v5->_contentHash;
    v5->_contentHash = (NSNumber *)v12;

    uint64_t v14 = [v4 numberValueAtColumnIndex:4];
    contentSequenceNumber = v5->_contentSequenceNumber;
    v5->_contentSequenceNumber = (NSNumber *)v14;

    uint64_t v16 = [v4 numberValueAtColumnIndex:5];
    contentState = v5->_contentState;
    v5->_contentState = (NSNumber *)v16;

    uint64_t v18 = [v4 numberValueAtColumnIndex:6];
    metaContentSequenceNumber = v5->_metaContentSequenceNumber;
    v5->_metaContentSequenceNumber = (NSNumber *)v18;

    uint64_t v20 = [v4 numberValueAtColumnIndex:7];
    metaContentState = v5->_metaContentState;
    v5->_metaContentState = (NSNumber *)v20;

    uint64_t v22 = [v4 numberValueAtColumnIndex:8];
    contentSequenceNumberEndOfRun = v5->_contentSequenceNumberEndOfRun;
    v5->_contentSequenceNumberEndOfRun = (NSNumber *)v22;

    uint64_t v24 = [v4 numberValueAtColumnIndex:9];
    metaContentSequenceNumberEndOfRun = v5->_metaContentSequenceNumberEndOfRun;
    v5->_metaContentSequenceNumberEndOfRun = (NSNumber *)v24;
  }
  return v5;
}

- (NSString)description
{
  v20.receiver = self;
  v20.super_class = (Class)CCProvenanceRecord;
  id v3 = [(CCProvenanceRecord *)&v20 description];
  contentHash = self->_contentHash;
  deviceRowId = self->_deviceRowId;
  provenanceRowId = self->_provenanceRowId;
  contentSequenceNumber = self->_contentSequenceNumber;
  instanceHash = self->_instanceHash;
  contentSequenceNumberEndOfRun = self->_contentSequenceNumberEndOfRun;
  unsigned __int8 v7 = [(NSNumber *)self->_contentState unsignedShortValue];
  if (v7 > 2u) {
    uint64_t v8 = @"Undefined";
  }
  else {
    uint64_t v8 = off_26527A170[(char)v7];
  }
  v9 = [NSString stringWithFormat:@"%@ (%u)", v8, v7];
  metaContentSequenceNumber = self->_metaContentSequenceNumber;
  metaContentSequenceNumberEndOfRun = self->_metaContentSequenceNumberEndOfRun;
  unsigned __int8 v12 = [(NSNumber *)self->_metaContentState unsignedShortValue];
  if (v12 > 2u) {
    v13 = @"Undefined";
  }
  else {
    v13 = off_26527A170[(char)v12];
  }
  uint64_t v14 = [NSString stringWithFormat:@"%@ (%u)", v13, v12];
  v15 = [v3 stringByAppendingFormat:@" provenanceRowId: %@, deviceRowId: %@, instanceHash: %@, contentHash: %@, contentSequenceNumber: %@, endOfRun: %@, contentState: %@, metaContentSequenceNumber: %@, endOfRun: %@, metaContentState: %@", provenanceRowId, deviceRowId, instanceHash, contentHash, contentSequenceNumber, contentSequenceNumberEndOfRun, v9, metaContentSequenceNumber, metaContentSequenceNumberEndOfRun, v14];

  return (NSString *)v15;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CCProvenanceRecord *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(CCProvenanceRecord *)self isEqualToItemRecord:v5];

  return v6;
}

- (BOOL)isEqualToItemRecord:(id)a3
{
  id v7 = a3;
  uint64_t v8 = v7;
  if (!v7)
  {
    char v12 = 0;
    goto LABEL_97;
  }
  provenanceRowId = self->_provenanceRowId;
  uint64_t v10 = provenanceRowId;
  if (!provenanceRowId)
  {
    id v3 = [v7 provenanceRowId];
    if (!v3)
    {
      int v11 = 0;
      goto LABEL_10;
    }
    uint64_t v10 = self->_provenanceRowId;
  }
  id v4 = [v8 provenanceRowId];
  if (([(NSNumber *)v10 isEqual:v4] & 1) == 0)
  {

    char v12 = 0;
    goto LABEL_95;
  }
  int v11 = 1;
LABEL_10:
  deviceRowId = self->_deviceRowId;
  uint64_t v14 = deviceRowId;
  if (!deviceRowId)
  {
    uint64_t v15 = [v8 deviceRowId];
    if (!v15)
    {
      v68 = 0;
      int v70 = 0;
      goto LABEL_17;
    }
    v68 = (void *)v15;
    uint64_t v14 = self->_deviceRowId;
  }
  v5 = [v8 deviceRowId];
  if (([(NSNumber *)v14 isEqual:v5] & 1) == 0)
  {

    char v12 = 0;
    goto LABEL_92;
  }
  int v70 = 1;
LABEL_17:
  instanceHash = self->_instanceHash;
  v17 = instanceHash;
  if (!instanceHash)
  {
    uint64_t v18 = [v8 instanceHash];
    if (!v18)
    {
      int v66 = v11;
      int v67 = 0;
      v64 = 0;
      goto LABEL_24;
    }
    v64 = (void *)v18;
    v17 = self->_instanceHash;
  }
  v69 = [v8 instanceHash];
  if (!-[NSNumber isEqual:](v17, "isEqual:"))
  {
    char v12 = 0;
    goto LABEL_89;
  }
  int v66 = v11;
  int v67 = 1;
LABEL_24:
  contentHash = self->_contentHash;
  objc_super v20 = contentHash;
  if (!contentHash)
  {
    uint64_t v21 = [v8 contentHash];
    if (!v21)
    {
      v60 = 0;
      int v63 = 0;
      goto LABEL_31;
    }
    v60 = (void *)v21;
    objc_super v20 = self->_contentHash;
  }
  v65 = [v8 contentHash];
  if (!-[NSNumber isEqual:](v20, "isEqual:"))
  {
    char v12 = 0;
    int v11 = v66;
    goto LABEL_86;
  }
  int v63 = 1;
LABEL_31:
  contentSequenceNumber = self->_contentSequenceNumber;
  v62 = contentSequenceNumber;
  if (!contentSequenceNumber)
  {
    uint64_t v23 = [v8 contentSequenceNumber];
    if (!v23)
    {
      v56 = 0;
      int v59 = 0;
      goto LABEL_38;
    }
    v56 = (void *)v23;
    contentSequenceNumber = self->_contentSequenceNumber;
  }
  v61 = [v8 contentSequenceNumber];
  if (!-[NSNumber isEqual:](contentSequenceNumber, "isEqual:"))
  {
    char v12 = 0;
    int v11 = v66;
    goto LABEL_83;
  }
  int v59 = 1;
LABEL_38:
  contentSequenceNumberEndOfRun = self->_contentSequenceNumberEndOfRun;
  v58 = contentSequenceNumberEndOfRun;
  if (!contentSequenceNumberEndOfRun)
  {
    uint64_t v25 = [v8 contentSequenceNumberEndOfRun];
    if (!v25)
    {
      v52 = 0;
      int v55 = 0;
      goto LABEL_45;
    }
    v52 = (void *)v25;
    contentSequenceNumberEndOfRun = self->_contentSequenceNumberEndOfRun;
  }
  v57 = [v8 contentSequenceNumberEndOfRun];
  if (!-[NSNumber isEqual:](contentSequenceNumberEndOfRun, "isEqual:"))
  {
    char v12 = 0;
    int v11 = v66;
    goto LABEL_80;
  }
  int v55 = 1;
LABEL_45:
  contentState = self->_contentState;
  v54 = contentState;
  if (!contentState)
  {
    uint64_t v27 = [v8 contentState];
    if (!v27)
    {
      v48 = 0;
      int v51 = 0;
      goto LABEL_52;
    }
    v48 = (void *)v27;
    contentState = self->_contentState;
  }
  v53 = [v8 contentState];
  if (!-[NSNumber isEqual:](contentState, "isEqual:"))
  {
    char v12 = 0;
    int v11 = v66;
    goto LABEL_77;
  }
  int v51 = 1;
LABEL_52:
  metaContentSequenceNumber = self->_metaContentSequenceNumber;
  v50 = metaContentSequenceNumber;
  if (!metaContentSequenceNumber)
  {
    uint64_t v29 = [v8 metaContentSequenceNumber];
    if (!v29)
    {
      v44 = 0;
      int v46 = 0;
      goto LABEL_59;
    }
    v44 = (void *)v29;
    metaContentSequenceNumber = self->_metaContentSequenceNumber;
  }
  v49 = [v8 metaContentSequenceNumber];
  if (!-[NSNumber isEqual:](metaContentSequenceNumber, "isEqual:"))
  {
    char v12 = 0;
    int v11 = v66;
    goto LABEL_74;
  }
  int v46 = 1;
LABEL_59:
  metaContentSequenceNumberEndOfRun = self->_metaContentSequenceNumberEndOfRun;
  v47 = metaContentSequenceNumberEndOfRun;
  if (!metaContentSequenceNumberEndOfRun)
  {
    uint64_t v31 = [v8 metaContentSequenceNumberEndOfRun];
    if (!v31)
    {
      v41 = 0;
      int v43 = 0;
      goto LABEL_66;
    }
    v41 = (void *)v31;
    metaContentSequenceNumberEndOfRun = self->_metaContentSequenceNumberEndOfRun;
  }
  v45 = [v8 metaContentSequenceNumberEndOfRun];
  if (!-[NSNumber isEqual:](metaContentSequenceNumberEndOfRun, "isEqual:"))
  {
    char v12 = 0;
    int v11 = v66;
LABEL_71:

    goto LABEL_72;
  }
  int v43 = 1;
LABEL_66:
  metaContentState = self->_metaContentState;
  v33 = metaContentState;
  if (!metaContentState)
  {
    uint64_t v34 = [v8 metaContentState];
    if (!v34)
    {
      v39 = 0;
      char v12 = 1;
      int v11 = v66;
      goto LABEL_116;
    }
    v40 = (void *)v34;
    v33 = self->_metaContentState;
  }
  v35 = v33;
  [v8 metaContentState];
  v36 = v42 = metaContentState;
  char v12 = [(NSNumber *)v35 isEqual:v36];

  if (v42)
  {
    int v11 = v66;
    if (!v43) {
      goto LABEL_72;
    }
    goto LABEL_71;
  }
  int v11 = v66;
  v39 = v40;
LABEL_116:

  if (v43) {
    goto LABEL_71;
  }
LABEL_72:
  if (v47)
  {
    if (!v46) {
      goto LABEL_75;
    }
    goto LABEL_74;
  }

  if (v46) {
LABEL_74:
  }

LABEL_75:
  if (v50)
  {
    if (!v51) {
      goto LABEL_78;
    }
    goto LABEL_77;
  }

  if (v51) {
LABEL_77:
  }

LABEL_78:
  if (v54)
  {
    if (!v55) {
      goto LABEL_81;
    }
    goto LABEL_80;
  }

  if (v55) {
LABEL_80:
  }

LABEL_81:
  if (v58)
  {
    if (!v59) {
      goto LABEL_84;
    }
    goto LABEL_83;
  }

  if (v59) {
LABEL_83:
  }

LABEL_84:
  if (v62)
  {
    if (!v63) {
      goto LABEL_87;
    }
    goto LABEL_86;
  }

  if (v63) {
LABEL_86:
  }

LABEL_87:
  if (contentHash)
  {
    if (v67) {
      goto LABEL_89;
    }
  }
  else
  {

    if (v67)
    {
LABEL_89:
      int v37 = v70;

      if (instanceHash) {
        goto LABEL_90;
      }
      goto LABEL_102;
    }
  }
  int v37 = v70;
  if (instanceHash)
  {
LABEL_90:
    if (!v37) {
      goto LABEL_92;
    }
    goto LABEL_91;
  }
LABEL_102:

  if (v37) {
LABEL_91:
  }

LABEL_92:
  if (deviceRowId)
  {
    if (!v11) {
      goto LABEL_95;
    }
    goto LABEL_94;
  }

  if (v11) {
LABEL_94:
  }

LABEL_95:
  if (!provenanceRowId) {

  }
LABEL_97:
  return v12;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSNumber *)self->_provenanceRowId hash];
  uint64_t v4 = [(NSNumber *)self->_deviceRowId hash] ^ v3;
  uint64_t v5 = [(NSNumber *)self->_instanceHash hash];
  uint64_t v6 = v4 ^ v5 ^ [(NSNumber *)self->_contentHash hash];
  uint64_t v7 = [(NSNumber *)self->_contentSequenceNumber hash];
  uint64_t v8 = v7 ^ [(NSNumber *)self->_contentState hash];
  uint64_t v9 = v6 ^ v8 ^ [(NSNumber *)self->_metaContentSequenceNumber hash];
  uint64_t v10 = [(NSNumber *)self->_metaContentState hash];
  uint64_t v11 = v10 ^ [(NSNumber *)self->_contentSequenceNumberEndOfRun hash];
  return v9 ^ v11 ^ [(NSNumber *)self->_metaContentSequenceNumberEndOfRun hash];
}

- (NSNumber)provenanceRowId
{
  return self->_provenanceRowId;
}

- (NSNumber)deviceRowId
{
  return self->_deviceRowId;
}

- (NSNumber)contentHash
{
  return self->_contentHash;
}

- (NSNumber)instanceHash
{
  return self->_instanceHash;
}

- (NSNumber)contentSequenceNumber
{
  return self->_contentSequenceNumber;
}

- (NSNumber)contentSequenceNumberEndOfRun
{
  return self->_contentSequenceNumberEndOfRun;
}

- (NSNumber)contentState
{
  return self->_contentState;
}

- (NSNumber)metaContentSequenceNumber
{
  return self->_metaContentSequenceNumber;
}

- (NSNumber)metaContentSequenceNumberEndOfRun
{
  return self->_metaContentSequenceNumberEndOfRun;
}

- (NSNumber)metaContentState
{
  return self->_metaContentState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metaContentState, 0);
  objc_storeStrong((id *)&self->_metaContentSequenceNumberEndOfRun, 0);
  objc_storeStrong((id *)&self->_metaContentSequenceNumber, 0);
  objc_storeStrong((id *)&self->_contentState, 0);
  objc_storeStrong((id *)&self->_contentSequenceNumberEndOfRun, 0);
  objc_storeStrong((id *)&self->_contentSequenceNumber, 0);
  objc_storeStrong((id *)&self->_instanceHash, 0);
  objc_storeStrong((id *)&self->_contentHash, 0);
  objc_storeStrong((id *)&self->_deviceRowId, 0);

  objc_storeStrong((id *)&self->_provenanceRowId, 0);
}

@end