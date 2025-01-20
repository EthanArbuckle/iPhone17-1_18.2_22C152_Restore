@interface IMCrossServiceAssociationMessageProcessingPipelineComponent
- (IMCrossServiceAssociationMessageProcessingPipelineComponent)initWithPipelineResources:(id)a3;
- (IMDiMessagePipelineResources)pipelineResources;
- (id)runIndividuallyWithInput:(id)a3;
@end

@implementation IMCrossServiceAssociationMessageProcessingPipelineComponent

- (IMCrossServiceAssociationMessageProcessingPipelineComponent)initWithPipelineResources:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IMCrossServiceAssociationMessageProcessingPipelineComponent;
  v6 = [(IMCrossServiceAssociationMessageProcessingPipelineComponent *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_pipelineResources, a3);
  }

  return v7;
}

- (id)runIndividuallyWithInput:(id)a3
{
  v58[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 crossServiceDeduplicationMechanism] == 1) {
    id v5 = (id)*MEMORY[0x1E4F6E1B8];
  }
  else {
    id v5 = 0;
  }
  uint64_t v6 = [v4 GUID];
  if (!v6) {
    goto LABEL_34;
  }
  v7 = (void *)v6;
  v8 = [v4 replacementGUID];

  if (!v8 || !v5) {
    goto LABEL_34;
  }
  objc_super v9 = [(IMCrossServiceAssociationMessageProcessingPipelineComponent *)self pipelineResources];
  v10 = [v9 messageStore];
  v11 = [v4 replacementGUID];
  v12 = [v10 messageWithGUID:v11];

  v13 = [(IMCrossServiceAssociationMessageProcessingPipelineComponent *)self pipelineResources];
  v14 = [v13 messageStore];
  v15 = [v4 GUID];
  v16 = [v14 messageWithGUID:v15];

  v17 = [(IMCrossServiceAssociationMessageProcessingPipelineComponent *)self pipelineResources];
  v18 = [v17 messageStore];
  v19 = [v4 GUID];
  v20 = [v18 existingChatForMessageGUID:v19];

  v55 = v20;
  if ([v4 isFromMe])
  {
    int v21 = 1;
    if (v16)
    {
LABEL_9:
      v22 = objc_msgSend(v16, "sender", v55);
      v23 = [v4 fromDisplayID];
      if ([v22 isEqualToString:v23])
      {
        int v24 = 1;
      }
      else if ([v4 isFromMe])
      {
        int v24 = [v16 isFromMe];
      }
      else
      {
        int v24 = 0;
      }

      goto LABEL_20;
    }
  }
  else
  {
    v25 = [v4 chat];
    if (v25)
    {
      v26 = [v20 chatIdentifier];
      v27 = [v4 chat];
      v28 = [v27 chatIdentifier];
      int v21 = [v26 isEqualToString:v28];

      v20 = v55;
    }
    else
    {
      int v21 = 0;
    }

    if (v16) {
      goto LABEL_9;
    }
  }
  int v24 = 0;
LABEL_20:
  if (v20) {
    int v29 = v21;
  }
  else {
    int v29 = 0;
  }
  int v30 = v29 & v24;
  if (v12
    && ([v12 service],
        v31 = objc_claimAutoreleasedReturnValue(),
        int v32 = [v31 isEqualToString:v5],
        v31,
        v20 = v55,
        v32))
  {
    if (v30)
    {
      v33 = [v16 plainBody];
      v34 = [v12 plainBody];
      int v35 = [v33 isEqualToString:v34];

      if (v35)
      {
        v36 = [(IMCrossServiceAssociationMessageProcessingPipelineComponent *)self pipelineResources];
        v37 = [v36 messageStore];
        v38 = [v16 guid];
        v58[0] = v38;
        v39 = [MEMORY[0x1E4F1C978] arrayWithObjects:v58 count:1];
        v40 = [v37 deleteMessageGUIDs:v39 inChat:v55];

        if ([v40 count])
        {
          v41 = [(IMCrossServiceAssociationMessageProcessingPipelineComponent *)self pipelineResources];
          v42 = [v41 broadcaster];
          v43 = [v16 guid];
          v57 = v43;
          v44 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v57 count:1];
          [v42 historicalMessageGUIDsDeleted:v44 chatGUIDs:0 queryID:0];
        }
      }
    }
    v45 = objc_msgSend(v4, "GUID", v55);
    [v12 setFallbackHash:v45];

    v46 = [(IMCrossServiceAssociationMessageProcessingPipelineComponent *)self pipelineResources];
    v47 = [v46 messageStore];
    id v48 = (id)[v47 storeMessage:v12 forceReplace:1 modifyError:0 modifyFlags:0 flagMask:0];

    v20 = v56;
  }
  else if (v30)
  {
    v49 = [v4 replacementGUID];
    [v16 setFallbackHash:v49];

    [v16 setExpectedServiceForCrossServiceReplacement:v5];
    [v16 setService:v5];
    v50 = [(IMCrossServiceAssociationMessageProcessingPipelineComponent *)self pipelineResources];
    v51 = [v50 messageStore];
    id v52 = (id)[v51 storeMessage:v16 forceReplace:1 modifyError:0 modifyFlags:0 flagMask:0];

    v20 = v55;
  }

LABEL_34:
  v53 = (void *)[objc_alloc(MEMORY[0x1E4F6BE98]) initWithValue:v4];

  return v53;
}

- (IMDiMessagePipelineResources)pipelineResources
{
  return self->_pipelineResources;
}

- (void).cxx_destruct
{
}

@end