@interface _BlastDoorRichLinkAttachmentSubstituter
- (BOOL)shouldIgnoreAppStoreMetadata;
- (BOOL)shouldSubstituteAttachments;
- (NSArray)attachmentsForUnarchiving;
- (NSMutableArray)archivedAttachments;
- (_BlastDoorRichLinkAttachmentSubstituter)init;
- (id)archiver:(id)a3 willEncodeObject:(id)a4;
- (id)unarchiver:(id)a3 didDecodeObject:(id)a4;
- (void)setAttachmentsForUnarchiving:(id)a3;
- (void)setShouldIgnoreAppStoreMetadata:(BOOL)a3;
- (void)setShouldSubstituteAttachments:(BOOL)a3;
@end

@implementation _BlastDoorRichLinkAttachmentSubstituter

- (_BlastDoorRichLinkAttachmentSubstituter)init
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v7.receiver = self;
  v7.super_class = (Class)_BlastDoorRichLinkAttachmentSubstituter;
  v2 = [(_BlastDoorRichLinkAttachmentSubstituter *)&v7 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    archivedAttachments = v2->_archivedAttachments;
    v2->_archivedAttachments = v3;

    *(_WORD *)&v2->_shouldSubstituteAttachments = 1;
    v5 = v2;
  }

  return v2;
}

- (id)archiver:(id)a3 willEncodeObject:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!self->_shouldSubstituteAttachments) {
    goto LABEL_13;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    v9 = [[_BlastDoorLPARAssetAttachmentSubstitute alloc] initWithARAsset:v8];
LABEL_7:
    v10 = (_BlastDoorLPVideoAttachmentSubstitute *)v9;
    [(_BlastDoorLPARAssetAttachmentSubstitute *)v9 setIndex:[(NSMutableArray *)self->_archivedAttachments count]];
    archivedAttachments = self->_archivedAttachments;
    v12 = [v8 data];

    [(NSMutableArray *)archivedAttachments addObject:v12];
    goto LABEL_17;
  }
  if (!self->_shouldSubstituteAttachments) {
    goto LABEL_13;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    v9 = [[_BlastDoorLPImageAttachmentSubstitute alloc] initWithImage:v8];
    goto LABEL_7;
  }
  if (!self->_shouldSubstituteAttachments || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
LABEL_13:
    if (self->_shouldIgnoreAppStoreMetadata && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
      v10 = 0;
    }
    else {
      v10 = (_BlastDoorLPVideoAttachmentSubstitute *)v7;
    }
    goto LABEL_17;
  }
  id v13 = v7;
  v14 = [v13 data];

  if (!v14)
  {

    goto LABEL_13;
  }
  v10 = [[_BlastDoorLPVideoAttachmentSubstitute alloc] initWithVideo:v13];
  [(_BlastDoorLPVideoAttachmentSubstitute *)v10 setIndex:[(NSMutableArray *)self->_archivedAttachments count]];
  v15 = self->_archivedAttachments;
  v16 = [v13 data];
  [(NSMutableArray *)v15 addObject:v16];

LABEL_17:
  return v10;
}

- (id)unarchiver:(id)a3 didDecodeObject:(id)a4
{
  id v6 = a3;
  if (self->_shouldSubstituteAttachments
    && ((objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
     || self->_shouldSubstituteAttachments
     && ((objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      || self->_shouldSubstituteAttachments && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))))
  {
    id v7 = a4;
    unint64_t v8 = [v7 index];
    if (v8 >= [(NSArray *)self->_attachmentsForUnarchiving count])
    {
      id v11 = [MEMORY[0x1E4F1CA98] null];
    }
    else
    {
      v9 = -[NSArray objectAtIndexedSubscript:](self->_attachmentsForUnarchiving, "objectAtIndexedSubscript:", [v7 index]);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v7 setFileURL:v9];
        id v10 = v7;
      }
      else
      {
        id v10 = [MEMORY[0x1E4F1CA98] null];
      }
      id v11 = v10;
    }
  }
  else
  {
    id v11 = a4;
  }

  return v11;
}

- (NSMutableArray)archivedAttachments
{
  return self->_archivedAttachments;
}

- (NSArray)attachmentsForUnarchiving
{
  return self->_attachmentsForUnarchiving;
}

- (void)setAttachmentsForUnarchiving:(id)a3
{
}

- (BOOL)shouldSubstituteAttachments
{
  return self->_shouldSubstituteAttachments;
}

- (void)setShouldSubstituteAttachments:(BOOL)a3
{
  self->_shouldSubstituteAttachments = a3;
}

- (BOOL)shouldIgnoreAppStoreMetadata
{
  return self->_shouldIgnoreAppStoreMetadata;
}

- (void)setShouldIgnoreAppStoreMetadata:(BOOL)a3
{
  self->_shouldIgnoreAppStoreMetadata = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attachmentsForUnarchiving, 0);
  objc_storeStrong((id *)&self->_archivedAttachments, 0);
}

@end