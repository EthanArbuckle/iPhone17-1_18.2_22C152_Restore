@interface _BlastDoorLPMessagesPayload
+ (BOOL)supportsSecureCoding;
+ (id)linkWithDataRepresentation:(id)a3 attachments:(id)a4;
- (BOOL)_needsWorkaroundForAppStoreTransformerCrash;
- (BOOL)isPlaceholder;
- (BOOL)needsCompleteFetch;
- (BOOL)needsSubresourceFetch;
- (_BlastDoorLPLinkMetadata)metadata;
- (_BlastDoorLPMessagesPayload)initWithCoder:(id)a3;
- (id)dataRepresentationWithOutOfLineAttachments:(id *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setMetadata:(id)a3;
- (void)setNeedsCompleteFetch:(BOOL)a3;
- (void)setNeedsSubresourceFetch:(BOOL)a3;
- (void)setPlaceholder:(BOOL)a3;
@end

@implementation _BlastDoorLPMessagesPayload

- (_BlastDoorLPMessagesPayload)initWithCoder:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_BlastDoorLPMessagesPayload;
  v5 = [(_BlastDoorLPMessagesPayload *)&v11 init];
  if (v5)
  {
    v5->_placeholder = [v4 decodeBoolForKey:@"richLinkIsPlaceholder"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"richLinkMetadata"];
    metadata = v5->_metadata;
    v5->_metadata = (_BlastDoorLPLinkMetadata *)v6;

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v8 = v5->_metadata;
      v5->_metadata = 0;
    }
    v9 = v5;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  BOOL placeholder = self->_placeholder;
  id v5 = a3;
  [v5 encodeBool:placeholder forKey:@"richLinkIsPlaceholder"];
  [v5 encodeObject:self->_metadata forKey:@"richLinkMetadata"];
}

+ (id)linkWithDataRepresentation:(id)a3 attachments:(id)a4
{
  v20[1] = *(id *)MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = (void *)[objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:v5 error:0];
  [v7 setClass:objc_opt_class() forClassName:@"RichLink"];
  [v7 setClass:objc_opt_class() forClassName:@"RichLinkARAssetAttachmentSubstitute"];
  [v7 setClass:objc_opt_class() forClassName:@"RichLinkImageAttachmentSubstitute"];
  [v7 setClass:objc_opt_class() forClassName:@"RichLinkVideoAttachmentSubstitute"];
  [v7 _enableStrictSecureDecodingMode];
  [v7 setDecodingFailurePolicy:1];
  v8 = objc_alloc_init(_BlastDoorRichLinkAttachmentSubstituter);
  [(_BlastDoorRichLinkAttachmentSubstituter *)v8 setAttachmentsForUnarchiving:v6];
  [v7 setDelegate:v8];
  v9 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_msgSend(v9, "setWithObjects:", v10, v11, objc_opt_class(), 0);
  uint64_t v13 = *MEMORY[0x1E4F284E8];
  v20[0] = 0;
  v14 = [v7 decodeTopLevelObjectOfClasses:v12 forKey:v13 error:v20];
  id v15 = v20[0];

  [v7 finishDecoding];
  if (v15) {
    goto LABEL_2;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v16 = v14;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v16 = objc_alloc_init(_BlastDoorLPMessagesPayload);
      [(_BlastDoorLPMessagesPayload *)v16 setMetadata:v14];
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_2:
        v16 = 0;
        goto LABEL_9;
      }
      v16 = objc_alloc_init(_BlastDoorLPMessagesPayload);
      id v17 = v14;
      v18 = [v17 metadata];
      [(_BlastDoorLPMessagesPayload *)v16 setMetadata:v18];

      -[_BlastDoorLPMessagesPayload setNeedsSubresourceFetch:](v16, "setNeedsSubresourceFetch:", [v17 hasFetchedSubresources] ^ 1);
      -[_BlastDoorLPMessagesPayload setNeedsCompleteFetch:](v16, "setNeedsCompleteFetch:", [v17 hasCompletedFetch] ^ 1);
    }
  }
LABEL_9:

  return v16;
}

- (id)dataRepresentationWithOutOfLineAttachments:(id *)a3
{
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F28DB0]) initRequiringSecureCoding:1];
  [v5 setClassName:@"RichLink" forClass:objc_opt_class()];
  [v5 setClassName:@"RichLinkARAssetAttachmentSubstitute" forClass:objc_opt_class()];
  [v5 setClassName:@"RichLinkImageAttachmentSubstitute" forClass:objc_opt_class()];
  [v5 setClassName:@"RichLinkVideoAttachmentSubstitute" forClass:objc_opt_class()];
  id v6 = objc_alloc_init(_BlastDoorRichLinkAttachmentSubstituter);
  [(_BlastDoorRichLinkAttachmentSubstituter *)v6 setShouldSubstituteAttachments:a3 != 0];
  [(_BlastDoorRichLinkAttachmentSubstituter *)v6 setShouldIgnoreAppStoreMetadata:[(_BlastDoorLPMessagesPayload *)self _needsWorkaroundForAppStoreTransformerCrash]];
  [v5 setDelegate:v6];
  [v5 encodeObject:self forKey:*MEMORY[0x1E4F284E8]];
  v7 = [v5 encodedData];
  if (a3)
  {
    *a3 = [(_BlastDoorRichLinkAttachmentSubstituter *)v6 archivedAttachments];
  }

  return v7;
}

- (BOOL)needsCompleteFetch
{
  return self->_needsCompleteFetch
      || [(_BlastDoorLPMessagesPayload *)self _needsWorkaroundForAppStoreTransformerCrash];
}

- (BOOL)_needsWorkaroundForAppStoreTransformerCrash
{
  v3 = [(_BlastDoorLPLinkMetadata *)self->_metadata specialization];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0) {
    return 0;
  }
  id v5 = [(_BlastDoorLPLinkMetadata *)self->_metadata specialization];
  id v6 = [v5 screenshots];
  BOOL v7 = [v6 count] == 0;

  return v7;
}

- (_BlastDoorLPLinkMetadata)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
}

- (BOOL)isPlaceholder
{
  return self->_placeholder;
}

- (void)setPlaceholder:(BOOL)a3
{
  self->_BOOL placeholder = a3;
}

- (BOOL)needsSubresourceFetch
{
  return self->_needsSubresourceFetch;
}

- (void)setNeedsSubresourceFetch:(BOOL)a3
{
  self->_needsSubresourceFetch = a3;
}

- (void)setNeedsCompleteFetch:(BOOL)a3
{
  self->_needsCompleteFetch = a3;
}

- (void).cxx_destruct
{
}

@end