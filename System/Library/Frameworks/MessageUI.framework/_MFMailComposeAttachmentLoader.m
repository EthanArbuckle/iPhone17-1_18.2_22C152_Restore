@interface _MFMailComposeAttachmentLoader
- (_MFMailComposeAttachmentLoader)initWithMessage:(id)a3 content:(id)a4 isDraft:(BOOL)a5 didLoadBestAlternative:(BOOL)a6 completion:(id)a7;
- (void)loadAttachments;
@end

@implementation _MFMailComposeAttachmentLoader

- (_MFMailComposeAttachmentLoader)initWithMessage:(id)a3 content:(id)a4 isDraft:(BOOL)a5 didLoadBestAlternative:(BOOL)a6 completion:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a7;
  v21.receiver = self;
  v21.super_class = (Class)_MFMailComposeAttachmentLoader;
  v16 = [(_MFMailComposeAttachmentLoader *)&v21 init];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_message, a3);
    objc_storeStrong(&v17->_content, a4);
    v17->_isDraft = a5;
    v17->_didLoadBestAlternative = a6;
    uint64_t v18 = [v15 copy];
    id completionBlock = v17->_completionBlock;
    v17->_id completionBlock = (id)v18;
  }
  return v17;
}

- (void)loadAttachments
{
  v42[1] = *MEMORY[0x1E4F143B8];
  v29 = [MEMORY[0x1E4F77B50] currentMonitor];
  id v27 = self->_content;
  if (v27 && (self->_didLoadBestAlternative || !self->_isDraft)
    || ([(MFMailMessage *)self->_message messageBody],
        v2 = objc_claimAutoreleasedReturnValue(),
        [v2 htmlContent],
        uint64_t v3 = objc_claimAutoreleasedReturnValue(),
        v27,
        v2,
        (id v27 = (id)v3) != 0))
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v4 = v27;
    }
    else
    {
      v42[0] = v27;
      id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v42 count:1];
    }
    v5 = v4;
    unint64_t v6 = [v4 count];
    if (v6 == 1)
    {
      v7 = [v5 lastObject];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        v9 = [v5 lastObject];
        uint64_t v10 = [v9 attachmentsInDocument];

        v5 = (void *)v10;
      }
    }
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    obuint64_t j = v5;
    uint64_t v11 = [obj countByEnumeratingWithState:&v36 objects:v41 count:16];
    if (v11)
    {
      uint64_t v12 = 0;
      uint64_t v13 = *(void *)v37;
      float v14 = (float)v6;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v37 != v13) {
            objc_enumerationMutation(obj);
          }
          v16 = *(void **)(*((void *)&v36 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            long long v34 = 0u;
            long long v35 = 0u;
            long long v32 = 0u;
            long long v33 = 0u;
            v17 = [MEMORY[0x1E4F77B78] allManagers];
            uint64_t v18 = [v17 countByEnumeratingWithState:&v32 objects:v40 count:16];
            if (v18)
            {
              uint64_t v19 = *(void *)v33;
              do
              {
                for (uint64_t j = 0; j != v18; ++j)
                {
                  if (*(void *)v33 != v19) {
                    objc_enumerationMutation(v17);
                  }
                  objc_super v21 = [*(id *)(*((void *)&v32 + 1) + 8 * j) attachmentForTextAttachment:v16 error:0];
                  v22 = v21;
                  if (v21)
                  {
                    id v23 = (id)[v21 fetchDataSynchronously:0];
                    id v24 = (id)[v16 fileWrapperForcingDownload:1];
                  }
                }
                uint64_t v18 = [v17 countByEnumeratingWithState:&v32 objects:v40 count:16];
              }
              while (v18);
            }
          }
          [v29 setPercentDone:(float)((float)(unint64_t)++v12 / v14)];
        }
        uint64_t v11 = [obj countByEnumeratingWithState:&v36 objects:v41 count:16];
      }
      while (v11);
    }
  }
  else
  {
    id v27 = 0;
    [v29 setPercentDone:1.0];
    obuint64_t j = 0;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49___MFMailComposeAttachmentLoader_loadAttachments__block_invoke;
  block[3] = &unk_1E5F79038;
  block[4] = self;
  id v31 = v27;
  id v25 = v27;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong(&self->_content, 0);

  objc_storeStrong((id *)&self->_message, 0);
}

@end