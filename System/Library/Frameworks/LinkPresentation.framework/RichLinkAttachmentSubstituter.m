@interface RichLinkAttachmentSubstituter
- (BOOL)shouldIgnoreAppStoreMetadata;
- (BOOL)shouldSubstituteAttachments;
- (NSArray)attachmentsForUnarchiving;
- (NSMutableArray)archivedAttachments;
- (RichLinkAttachmentSubstituter)init;
- (id)applyAttachmentSubstitutionForObject:(id)a3;
- (id)archiver:(id)a3 willEncodeObject:(id)a4;
- (id)unarchiver:(id)a3 didDecodeObject:(id)a4;
- (void)setAttachmentsForUnarchiving:(id)a3;
- (void)setShouldIgnoreAppStoreMetadata:(BOOL)a3;
- (void)setShouldSubstituteAttachments:(BOOL)a3;
@end

@implementation RichLinkAttachmentSubstituter

- (RichLinkAttachmentSubstituter)init
{
  v7.receiver = self;
  v7.super_class = (Class)RichLinkAttachmentSubstituter;
  v2 = [(RichLinkAttachmentSubstituter *)&v7 init];
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
  if (self->_shouldSubstituteAttachments)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v8 = v7;
      v9 = [v8 data];

      if (v9)
      {
        v9 = [[LPARAssetAttachmentSubstitute alloc] initWithARAsset:v8];
        [(LPARAssetAttachmentSubstitute *)v9 setIndex:[(NSMutableArray *)self->_archivedAttachments count]];
        archivedAttachments = self->_archivedAttachments;
        v11 = [v8 data];
        [(NSMutableArray *)archivedAttachments addObject:v11];
LABEL_13:

        goto LABEL_14;
      }
      goto LABEL_14;
    }
    if (self->_shouldSubstituteAttachments)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v8 = v7;
        v9 = [v8 data];

        if (v9)
        {
          v9 = [[LPImageAttachmentSubstitute alloc] initWithImage:v8];
          [(LPARAssetAttachmentSubstitute *)v9 setIndex:[(NSMutableArray *)self->_archivedAttachments count]];
          v12 = self->_archivedAttachments;
          v11 = [v8 data];
          [(NSMutableArray *)v12 addObject:v11];
          goto LABEL_13;
        }
LABEL_14:

        goto LABEL_22;
      }
      if (self->_shouldSubstituteAttachments)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v8 = v7;
          v13 = [v8 data];

          if (v13)
          {
            v9 = [[LPVideoAttachmentSubstitute alloc] initWithVideo:v8];
            [(LPARAssetAttachmentSubstitute *)v9 setIndex:[(NSMutableArray *)self->_archivedAttachments count]];
            v14 = self->_archivedAttachments;
            v11 = [v8 data];
            [(NSMutableArray *)v14 addObject:v11];
            goto LABEL_13;
          }
        }
      }
    }
  }
  if (self->_shouldIgnoreAppStoreMetadata && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v15 = LPLogChannelFetching();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[RichLinkAttachmentSubstituter archiver:willEncodeObject:](v15);
    }
    v9 = 0;
  }
  else
  {
    v9 = (LPARAssetAttachmentSubstitute *)v7;
  }
LABEL_22:

  return v9;
}

- (id)applyAttachmentSubstitutionForObject:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    unint64_t v6 = [v5 index];
    if (v6 < [(NSArray *)self->_attachmentsForUnarchiving count])
    {
      id v7 = -[NSArray objectAtIndexedSubscript:](self->_attachmentsForUnarchiving, "objectAtIndexedSubscript:", [v5 index]);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v5 setFileURL:v7];
LABEL_21:
        id v20 = [[LPARAsset alloc] _initWithARAsset:v5];
        goto LABEL_41;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v5 setData:v7];
        goto LABEL_21;
      }
      v24 = (id)LPLogChannelFetching();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        int v27 = 134217984;
        uint64_t v28 = [v5 index];
        _os_log_impl(&dword_1A35DC000, v24, OS_LOG_TYPE_DEFAULT, "RichLink: Link referred to attachment %ld, but it is not a URL or data", (uint8_t *)&v27, 0xCu);
      }
LABEL_31:

      id v20 = [MEMORY[0x1E4F1CA98] null];
      goto LABEL_41;
    }
    v10 = (id)LPLogChannelFetching();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = [v5 index];
      NSUInteger v12 = [(NSArray *)self->_attachmentsForUnarchiving count];
      int v27 = 134218240;
      uint64_t v28 = v11;
      __int16 v29 = 2048;
      NSUInteger v30 = v12;
      _os_log_impl(&dword_1A35DC000, v10, OS_LOG_TYPE_DEFAULT, "RichLink: Link referred to attachment %ld, but we only have %lu", (uint8_t *)&v27, 0x16u);
    }
LABEL_11:

    uint64_t v13 = [MEMORY[0x1E4F1CA98] null];
    goto LABEL_25;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v4;
    unint64_t v9 = [v8 index];
    if (v9 < [(NSArray *)self->_attachmentsForUnarchiving count])
    {
      id v7 = -[NSArray objectAtIndexedSubscript:](self->_attachmentsForUnarchiving, "objectAtIndexedSubscript:", [v8 index]);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v8 setFileURL:v7];
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v24 = (id)LPLogChannelFetching();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            int v27 = 134217984;
            uint64_t v28 = [v8 index];
            _os_log_impl(&dword_1A35DC000, v24, OS_LOG_TYPE_DEFAULT, "RichLink: Link referred to attachment %ld, but it is not a URL or data", (uint8_t *)&v27, 0xCu);
          }
          goto LABEL_31;
        }
        [v8 setData:v7];
      }
      id v20 = [[LPImage alloc] _initWithImage:v8];
      goto LABEL_41;
    }
    v10 = (id)LPLogChannelFetching();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v18 = [v8 index];
      NSUInteger v19 = [(NSArray *)self->_attachmentsForUnarchiving count];
      int v27 = 134218240;
      uint64_t v28 = v18;
      __int16 v29 = 2048;
      NSUInteger v30 = v19;
      _os_log_impl(&dword_1A35DC000, v10, OS_LOG_TYPE_DEFAULT, "RichLink: Link referred to attachment %ld, but we only have %lu", (uint8_t *)&v27, 0x16u);
    }
    goto LABEL_11;
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v15 = v4;
  v16 = v15;
  if ((isKindOfClass & 1) == 0) {
    goto LABEL_43;
  }
  unint64_t v17 = [v15 index];
  if (v17 < [(NSArray *)self->_attachmentsForUnarchiving count])
  {
    id v7 = -[NSArray objectAtIndexedSubscript:](self->_attachmentsForUnarchiving, "objectAtIndexedSubscript:", [v16 index]);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v16 setFileURL:v7];
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v25 = (id)LPLogChannelFetching();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          int v27 = 134217984;
          uint64_t v28 = [v16 index];
          _os_log_impl(&dword_1A35DC000, v25, OS_LOG_TYPE_DEFAULT, "RichLink: Link referred to attachment %ld, but it is not a URL or data", (uint8_t *)&v27, 0xCu);
        }

        id v20 = [MEMORY[0x1E4F1CA98] null];
        goto LABEL_41;
      }
      [v16 setData:v7];
    }
    id v20 = [[LPVideo alloc] _initWithVideo:v16];
LABEL_41:
    v16 = v20;

    goto LABEL_42;
  }
  v21 = (id)LPLogChannelFetching();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v22 = [v16 index];
    NSUInteger v23 = [(NSArray *)self->_attachmentsForUnarchiving count];
    int v27 = 134218240;
    uint64_t v28 = v22;
    __int16 v29 = 2048;
    NSUInteger v30 = v23;
    _os_log_impl(&dword_1A35DC000, v21, OS_LOG_TYPE_DEFAULT, "RichLink: Link referred to attachment %ld, but we only have %lu", (uint8_t *)&v27, 0x16u);
  }

  uint64_t v13 = [MEMORY[0x1E4F1CA98] null];
LABEL_25:
  v16 = (void *)v13;
LABEL_42:

LABEL_43:

  return v16;
}

- (id)unarchiver:(id)a3 didDecodeObject:(id)a4
{
  if (self->_shouldSubstituteAttachments)
  {
    id v5 = [(RichLinkAttachmentSubstituter *)self applyAttachmentSubstitutionForObject:a4];
  }
  else
  {
    id v5 = a4;
  }
  unint64_t v6 = v5;

  return v6;
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

- (void)archiver:(os_log_t)log willEncodeObject:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A35DC000, log, OS_LOG_TYPE_ERROR, "RichLink: Did not encode an instance of LPiTunesMediaSoftwareMetadata because it had no screenshots.", v1, 2u);
}

@end