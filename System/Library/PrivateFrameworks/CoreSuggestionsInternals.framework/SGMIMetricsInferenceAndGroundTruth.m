@interface SGMIMetricsInferenceAndGroundTruth
+ (Class)missingAttachmentType;
+ (Class)missingRecipientType;
- (BOOL)estimatedGroundTruth;
- (BOOL)hasEstimatedGroundTruth;
- (BOOL)hasMissingAttachmentPredictionPerformanceInMilliSeconds;
- (BOOL)hasMissingRecipientPredictionPerformanceInMilliSeconds;
- (BOOL)hasPredictedSaliency;
- (BOOL)hasPredictedSaliencyScore;
- (BOOL)hasSaliencyPredictionPerformanceInMilliSeconds;
- (BOOL)hasSubmodelsProbabilities;
- (BOOL)hasTrialMetadata;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)missingAttachments;
- (NSMutableArray)missingRecipients;
- (SGMIMetricsSubmodelsProbabilities)submodelsProbabilities;
- (SGMIMetricsTrialMetadata)trialMetadata;
- (float)predictedSaliencyScore;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)missingAttachmentAtIndex:(unint64_t)a3;
- (id)missingRecipientAtIndex:(unint64_t)a3;
- (id)predictedSaliencyAsString:(int)a3;
- (int)StringAsPredictedSaliency:(id)a3;
- (int)predictedSaliency;
- (unint64_t)hash;
- (unint64_t)missingAttachmentPredictionPerformanceInMilliSeconds;
- (unint64_t)missingAttachmentsCount;
- (unint64_t)missingRecipientPredictionPerformanceInMilliSeconds;
- (unint64_t)missingRecipientsCount;
- (unint64_t)saliencyPredictionPerformanceInMilliSeconds;
- (void)addMissingAttachment:(id)a3;
- (void)addMissingRecipient:(id)a3;
- (void)clearMissingAttachments;
- (void)clearMissingRecipients;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setEstimatedGroundTruth:(BOOL)a3;
- (void)setHasEstimatedGroundTruth:(BOOL)a3;
- (void)setHasMissingAttachmentPredictionPerformanceInMilliSeconds:(BOOL)a3;
- (void)setHasMissingRecipientPredictionPerformanceInMilliSeconds:(BOOL)a3;
- (void)setHasPredictedSaliency:(BOOL)a3;
- (void)setHasPredictedSaliencyScore:(BOOL)a3;
- (void)setHasSaliencyPredictionPerformanceInMilliSeconds:(BOOL)a3;
- (void)setMissingAttachmentPredictionPerformanceInMilliSeconds:(unint64_t)a3;
- (void)setMissingAttachments:(id)a3;
- (void)setMissingRecipientPredictionPerformanceInMilliSeconds:(unint64_t)a3;
- (void)setMissingRecipients:(id)a3;
- (void)setPredictedSaliency:(int)a3;
- (void)setPredictedSaliencyScore:(float)a3;
- (void)setSaliencyPredictionPerformanceInMilliSeconds:(unint64_t)a3;
- (void)setSubmodelsProbabilities:(id)a3;
- (void)setTrialMetadata:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SGMIMetricsInferenceAndGroundTruth

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trialMetadata, 0);
  objc_storeStrong((id *)&self->_submodelsProbabilities, 0);
  objc_storeStrong((id *)&self->_missingRecipients, 0);
  objc_storeStrong((id *)&self->_missingAttachments, 0);
}

- (unint64_t)missingRecipientPredictionPerformanceInMilliSeconds
{
  return self->_missingRecipientPredictionPerformanceInMilliSeconds;
}

- (void)setMissingRecipients:(id)a3
{
}

- (NSMutableArray)missingRecipients
{
  return self->_missingRecipients;
}

- (unint64_t)missingAttachmentPredictionPerformanceInMilliSeconds
{
  return self->_missingAttachmentPredictionPerformanceInMilliSeconds;
}

- (void)setMissingAttachments:(id)a3
{
}

- (NSMutableArray)missingAttachments
{
  return self->_missingAttachments;
}

- (BOOL)estimatedGroundTruth
{
  return self->_estimatedGroundTruth;
}

- (unint64_t)saliencyPredictionPerformanceInMilliSeconds
{
  return self->_saliencyPredictionPerformanceInMilliSeconds;
}

- (float)predictedSaliencyScore
{
  return self->_predictedSaliencyScore;
}

- (void)setSubmodelsProbabilities:(id)a3
{
}

- (SGMIMetricsSubmodelsProbabilities)submodelsProbabilities
{
  return self->_submodelsProbabilities;
}

- (void)setTrialMetadata:(id)a3
{
}

- (SGMIMetricsTrialMetadata)trialMetadata
{
  return self->_trialMetadata;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  trialMetadata = self->_trialMetadata;
  uint64_t v6 = *((void *)v4 + 8);
  if (trialMetadata)
  {
    if (v6) {
      -[SGMIMetricsTrialMetadata mergeFrom:](trialMetadata, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[SGMIMetricsInferenceAndGroundTruth setTrialMetadata:](self, "setTrialMetadata:");
  }
  submodelsProbabilities = self->_submodelsProbabilities;
  uint64_t v8 = *((void *)v4 + 7);
  if (submodelsProbabilities)
  {
    if (v8) {
      -[SGMIMetricsSubmodelsProbabilities mergeFrom:](submodelsProbabilities, "mergeFrom:");
    }
  }
  else if (v8)
  {
    -[SGMIMetricsInferenceAndGroundTruth setSubmodelsProbabilities:](self, "setSubmodelsProbabilities:");
  }
  char v9 = *((unsigned char *)v4 + 76);
  if ((v9 & 0x10) != 0)
  {
    self->_predictedSaliencyScore = *((float *)v4 + 13);
    *(unsigned char *)&self->_has |= 0x10u;
    char v9 = *((unsigned char *)v4 + 76);
    if ((v9 & 8) == 0)
    {
LABEL_13:
      if ((v9 & 4) == 0) {
        goto LABEL_14;
      }
      goto LABEL_37;
    }
  }
  else if ((*((unsigned char *)v4 + 76) & 8) == 0)
  {
    goto LABEL_13;
  }
  self->_predictedSaliency = *((_DWORD *)v4 + 12);
  *(unsigned char *)&self->_has |= 8u;
  char v9 = *((unsigned char *)v4 + 76);
  if ((v9 & 4) == 0)
  {
LABEL_14:
    if ((v9 & 0x20) == 0) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
LABEL_37:
  self->_saliencyPredictionPerformanceInMilliSeconds = *((void *)v4 + 3);
  *(unsigned char *)&self->_has |= 4u;
  if ((*((unsigned char *)v4 + 76) & 0x20) != 0)
  {
LABEL_15:
    self->_estimatedGroundTruth = *((unsigned char *)v4 + 72);
    *(unsigned char *)&self->_has |= 0x20u;
  }
LABEL_16:
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v10 = *((id *)v4 + 4);
  uint64_t v11 = [v10 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v25 != v13) {
          objc_enumerationMutation(v10);
        }
        [(SGMIMetricsInferenceAndGroundTruth *)self addMissingAttachment:*(void *)(*((void *)&v24 + 1) + 8 * i)];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v12);
  }

  if (*((unsigned char *)v4 + 76))
  {
    self->_missingAttachmentPredictionPerformanceInMilliSeconds = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v15 = *((id *)v4 + 5);
  uint64_t v16 = [v15 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v21;
    do
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v21 != v18) {
          objc_enumerationMutation(v15);
        }
        -[SGMIMetricsInferenceAndGroundTruth addMissingRecipient:](self, "addMissingRecipient:", *(void *)(*((void *)&v20 + 1) + 8 * j), (void)v20);
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v20 objects:v28 count:16];
    }
    while (v17);
  }

  if ((*((unsigned char *)v4 + 76) & 2) != 0)
  {
    self->_missingRecipientPredictionPerformanceInMilliSeconds = *((void *)v4 + 2);
    *(unsigned char *)&self->_has |= 2u;
  }
}

- (unint64_t)hash
{
  unint64_t v18 = [(SGMIMetricsTrialMetadata *)self->_trialMetadata hash];
  unint64_t v3 = [(SGMIMetricsSubmodelsProbabilities *)self->_submodelsProbabilities hash];
  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    float predictedSaliencyScore = self->_predictedSaliencyScore;
    float v7 = -predictedSaliencyScore;
    if (predictedSaliencyScore >= 0.0) {
      float v7 = self->_predictedSaliencyScore;
    }
    float v8 = floorf(v7 + 0.5);
    float v9 = (float)(v7 - v8) * 1.8447e19;
    unint64_t v5 = 2654435761u * (unint64_t)fmodf(v8, 1.8447e19);
    if (v9 >= 0.0)
    {
      if (v9 > 0.0) {
        v5 += (unint64_t)v9;
      }
    }
    else
    {
      v5 -= (unint64_t)fabsf(v9);
    }
  }
  else
  {
    unint64_t v5 = 0;
  }
  if ((has & 8) == 0)
  {
    uint64_t v10 = 0;
    if ((has & 4) != 0) {
      goto LABEL_11;
    }
LABEL_14:
    unint64_t v11 = 0;
    if ((has & 0x20) != 0) {
      goto LABEL_12;
    }
    goto LABEL_15;
  }
  uint64_t v10 = 2654435761 * self->_predictedSaliency;
  if ((has & 4) == 0) {
    goto LABEL_14;
  }
LABEL_11:
  unint64_t v11 = 2654435761u * self->_saliencyPredictionPerformanceInMilliSeconds;
  if ((has & 0x20) != 0)
  {
LABEL_12:
    uint64_t v12 = 2654435761 * self->_estimatedGroundTruth;
    goto LABEL_16;
  }
LABEL_15:
  uint64_t v12 = 0;
LABEL_16:
  uint64_t v13 = [(NSMutableArray *)self->_missingAttachments hash];
  if (*(unsigned char *)&self->_has) {
    unint64_t v14 = 2654435761u * self->_missingAttachmentPredictionPerformanceInMilliSeconds;
  }
  else {
    unint64_t v14 = 0;
  }
  uint64_t v15 = [(NSMutableArray *)self->_missingRecipients hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    unint64_t v16 = 2654435761u * self->_missingRecipientPredictionPerformanceInMilliSeconds;
  }
  else {
    unint64_t v16 = 0;
  }
  return v3 ^ v18 ^ v5 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_44;
  }
  trialMetadata = self->_trialMetadata;
  if ((unint64_t)trialMetadata | *((void *)v4 + 8))
  {
    if (!-[SGMIMetricsTrialMetadata isEqual:](trialMetadata, "isEqual:")) {
      goto LABEL_44;
    }
  }
  submodelsProbabilities = self->_submodelsProbabilities;
  if ((unint64_t)submodelsProbabilities | *((void *)v4 + 7))
  {
    if (!-[SGMIMetricsSubmodelsProbabilities isEqual:](submodelsProbabilities, "isEqual:")) {
      goto LABEL_44;
    }
  }
  char has = (char)self->_has;
  char v8 = *((unsigned char *)v4 + 76);
  if ((has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 76) & 0x10) == 0 || self->_predictedSaliencyScore != *((float *)v4 + 13)) {
      goto LABEL_44;
    }
  }
  else if ((*((unsigned char *)v4 + 76) & 0x10) != 0)
  {
    goto LABEL_44;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 76) & 8) == 0 || self->_predictedSaliency != *((_DWORD *)v4 + 12)) {
      goto LABEL_44;
    }
  }
  else if ((*((unsigned char *)v4 + 76) & 8) != 0)
  {
    goto LABEL_44;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 76) & 4) == 0 || self->_saliencyPredictionPerformanceInMilliSeconds != *((void *)v4 + 3)) {
      goto LABEL_44;
    }
  }
  else if ((*((unsigned char *)v4 + 76) & 4) != 0)
  {
    goto LABEL_44;
  }
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    if ((*((unsigned char *)v4 + 76) & 0x20) == 0) {
      goto LABEL_44;
    }
    if (self->_estimatedGroundTruth)
    {
      if (!*((unsigned char *)v4 + 72)) {
        goto LABEL_44;
      }
    }
    else if (*((unsigned char *)v4 + 72))
    {
      goto LABEL_44;
    }
  }
  else if ((*((unsigned char *)v4 + 76) & 0x20) != 0)
  {
    goto LABEL_44;
  }
  missingAttachments = self->_missingAttachments;
  if ((unint64_t)missingAttachments | *((void *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](missingAttachments, "isEqual:")) {
      goto LABEL_44;
    }
    char has = (char)self->_has;
    char v8 = *((unsigned char *)v4 + 76);
  }
  if (has)
  {
    if ((v8 & 1) == 0 || self->_missingAttachmentPredictionPerformanceInMilliSeconds != *((void *)v4 + 1)) {
      goto LABEL_44;
    }
  }
  else if (v8)
  {
    goto LABEL_44;
  }
  missingRecipients = self->_missingRecipients;
  if ((unint64_t)missingRecipients | *((void *)v4 + 5))
  {
    if (-[NSMutableArray isEqual:](missingRecipients, "isEqual:"))
    {
      char has = (char)self->_has;
      char v8 = *((unsigned char *)v4 + 76);
      goto LABEL_40;
    }
LABEL_44:
    BOOL v11 = 0;
    goto LABEL_45;
  }
LABEL_40:
  BOOL v11 = (v8 & 2) == 0;
  if ((has & 2) != 0)
  {
    if ((v8 & 2) == 0 || self->_missingRecipientPredictionPerformanceInMilliSeconds != *((void *)v4 + 2)) {
      goto LABEL_44;
    }
    BOOL v11 = 1;
  }
LABEL_45:

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(SGMIMetricsTrialMetadata *)self->_trialMetadata copyWithZone:a3];
  float v7 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v6;

  id v8 = [(SGMIMetricsSubmodelsProbabilities *)self->_submodelsProbabilities copyWithZone:a3];
  float v9 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v8;

  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    *(float *)(v5 + 52) = self->_predictedSaliencyScore;
    *(unsigned char *)(v5 + 76) |= 0x10u;
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_27;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 48) = self->_predictedSaliency;
  *(unsigned char *)(v5 + 76) |= 8u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_27:
  *(void *)(v5 + 24) = self->_saliencyPredictionPerformanceInMilliSeconds;
  *(unsigned char *)(v5 + 76) |= 4u;
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
LABEL_5:
    *(unsigned char *)(v5 + 72) = self->_estimatedGroundTruth;
    *(unsigned char *)(v5 + 76) |= 0x20u;
  }
LABEL_6:
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  BOOL v11 = self->_missingAttachments;
  uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v29 != v14) {
          objc_enumerationMutation(v11);
        }
        unint64_t v16 = (void *)[*(id *)(*((void *)&v28 + 1) + 8 * i) copyWithZone:a3];
        [(id)v5 addMissingAttachment:v16];
      }
      uint64_t v13 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v13);
  }

  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_missingAttachmentPredictionPerformanceInMilliSeconds;
    *(unsigned char *)(v5 + 76) |= 1u;
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v17 = self->_missingRecipients;
  uint64_t v18 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v24 objects:v32 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v25;
    do
    {
      for (uint64_t j = 0; j != v19; ++j)
      {
        if (*(void *)v25 != v20) {
          objc_enumerationMutation(v17);
        }
        long long v22 = objc_msgSend(*(id *)(*((void *)&v24 + 1) + 8 * j), "copyWithZone:", a3, (void)v24);
        [(id)v5 addMissingRecipient:v22];
      }
      uint64_t v19 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v24 objects:v32 count:16];
    }
    while (v19);
  }

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(void *)(v5 + 16) = self->_missingRecipientPredictionPerformanceInMilliSeconds;
    *(unsigned char *)(v5 + 76) |= 2u;
  }
  return (id)v5;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v14 = v4;
  if (self->_trialMetadata)
  {
    objc_msgSend(v4, "setTrialMetadata:");
    id v4 = v14;
  }
  if (self->_submodelsProbabilities)
  {
    objc_msgSend(v14, "setSubmodelsProbabilities:");
    id v4 = v14;
  }
  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    *((_DWORD *)v4 + 13) = LODWORD(self->_predictedSaliencyScore);
    *((unsigned char *)v4 + 76) |= 0x10u;
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_7:
      if ((has & 4) == 0) {
        goto LABEL_8;
      }
LABEL_27:
      *((void *)v4 + 3) = self->_saliencyPredictionPerformanceInMilliSeconds;
      *((unsigned char *)v4 + 76) |= 4u;
      if ((*(unsigned char *)&self->_has & 0x20) == 0) {
        goto LABEL_10;
      }
      goto LABEL_9;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_7;
  }
  *((_DWORD *)v4 + 12) = self->_predictedSaliency;
  *((unsigned char *)v4 + 76) |= 8u;
  char has = (char)self->_has;
  if ((has & 4) != 0) {
    goto LABEL_27;
  }
LABEL_8:
  if ((has & 0x20) != 0)
  {
LABEL_9:
    *((unsigned char *)v4 + 72) = self->_estimatedGroundTruth;
    *((unsigned char *)v4 + 76) |= 0x20u;
  }
LABEL_10:
  if ([(SGMIMetricsInferenceAndGroundTruth *)self missingAttachmentsCount])
  {
    [v14 clearMissingAttachments];
    unint64_t v6 = [(SGMIMetricsInferenceAndGroundTruth *)self missingAttachmentsCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
      {
        float v9 = [(SGMIMetricsInferenceAndGroundTruth *)self missingAttachmentAtIndex:i];
        [v14 addMissingAttachment:v9];
      }
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    *((void *)v14 + 1) = self->_missingAttachmentPredictionPerformanceInMilliSeconds;
    *((unsigned char *)v14 + 76) |= 1u;
  }
  if ([(SGMIMetricsInferenceAndGroundTruth *)self missingRecipientsCount])
  {
    [v14 clearMissingRecipients];
    unint64_t v10 = [(SGMIMetricsInferenceAndGroundTruth *)self missingRecipientsCount];
    if (v10)
    {
      unint64_t v11 = v10;
      for (uint64_t j = 0; j != v11; ++j)
      {
        uint64_t v13 = [(SGMIMetricsInferenceAndGroundTruth *)self missingRecipientAtIndex:j];
        [v14 addMissingRecipient:v13];
      }
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((void *)v14 + 2) = self->_missingRecipientPredictionPerformanceInMilliSeconds;
    *((unsigned char *)v14 + 76) |= 2u;
  }
}

- (void)writeTo:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_trialMetadata) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_submodelsProbabilities) {
    PBDataWriterWriteSubmessage();
  }
  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    PBDataWriterWriteFloatField();
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_7:
      if ((has & 4) == 0) {
        goto LABEL_8;
      }
      goto LABEL_31;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteInt32Field();
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_8:
    if ((has & 0x20) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_31:
  PBDataWriterWriteUint64Field();
  if ((*(unsigned char *)&self->_has & 0x20) != 0) {
LABEL_9:
  }
    PBDataWriterWriteBOOLField();
LABEL_10:
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  unint64_t v6 = self->_missingAttachments;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v8);
  }

  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint64Field();
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  unint64_t v11 = self->_missingRecipients;
  uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v17;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v11);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v13 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v13);
  }

  if ((*(unsigned char *)&self->_has & 2) != 0) {
    PBDataWriterWriteUint64Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return SGMIMetricsInferenceAndGroundTruthReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  trialMetadata = self->_trialMetadata;
  if (trialMetadata)
  {
    unint64_t v6 = [(SGMIMetricsTrialMetadata *)trialMetadata dictionaryRepresentation];
    [v3 setObject:v6 forKey:@"trialMetadata"];
  }
  submodelsProbabilities = self->_submodelsProbabilities;
  if (submodelsProbabilities)
  {
    uint64_t v8 = [(SGMIMetricsSubmodelsProbabilities *)submodelsProbabilities dictionaryRepresentation];
    [v3 setObject:v8 forKey:@"submodelsProbabilities"];
  }
  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    *(float *)&double v4 = self->_predictedSaliencyScore;
    long long v28 = [NSNumber numberWithFloat:v4];
    [v3 setObject:v28 forKey:@"predictedSaliencyScore"];

    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_7:
      if ((has & 4) == 0) {
        goto LABEL_8;
      }
      goto LABEL_40;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_7;
  }
  unsigned int v29 = self->_predictedSaliency - 1;
  if (v29 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_predictedSaliency);
    long long v30 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    long long v30 = off_1E65C02C0[v29];
  }
  [v3 setObject:v30 forKey:@"predictedSaliency"];

  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_8:
    if ((has & 0x20) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_40:
  long long v31 = [NSNumber numberWithUnsignedLongLong:self->_saliencyPredictionPerformanceInMilliSeconds];
  [v3 setObject:v31 forKey:@"saliencyPredictionPerformanceInMilliSeconds"];

  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
LABEL_9:
    unint64_t v10 = [NSNumber numberWithBool:self->_estimatedGroundTruth];
    [v3 setObject:v10 forKey:@"estimatedGroundTruth"];
  }
LABEL_10:
  if ([(NSMutableArray *)self->_missingAttachments count])
  {
    unint64_t v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_missingAttachments, "count"));
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    uint64_t v12 = self->_missingAttachments;
    uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v36 objects:v41 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v37;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v37 != v15) {
            objc_enumerationMutation(v12);
          }
          long long v17 = [*(id *)(*((void *)&v36 + 1) + 8 * i) dictionaryRepresentation];
          [v11 addObject:v17];
        }
        uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v36 objects:v41 count:16];
      }
      while (v14);
    }

    [v3 setObject:v11 forKey:@"missingAttachment"];
  }
  if (*(unsigned char *)&self->_has)
  {
    long long v18 = [NSNumber numberWithUnsignedLongLong:self->_missingAttachmentPredictionPerformanceInMilliSeconds];
    [v3 setObject:v18 forKey:@"missingAttachmentPredictionPerformanceInMilliSeconds"];
  }
  if ([(NSMutableArray *)self->_missingRecipients count])
  {
    long long v19 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_missingRecipients, "count"));
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v20 = self->_missingRecipients;
    uint64_t v21 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v32 objects:v40 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v33;
      do
      {
        for (uint64_t j = 0; j != v22; ++j)
        {
          if (*(void *)v33 != v23) {
            objc_enumerationMutation(v20);
          }
          long long v25 = [*(id *)(*((void *)&v32 + 1) + 8 * j) dictionaryRepresentation];
          [v19 addObject:v25];
        }
        uint64_t v22 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v32 objects:v40 count:16];
      }
      while (v22);
    }

    [v3 setObject:v19 forKey:@"missingRecipient"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v26 = [NSNumber numberWithUnsignedLongLong:self->_missingRecipientPredictionPerformanceInMilliSeconds];
    [v3 setObject:v26 forKey:@"missingRecipientPredictionPerformanceInMilliSeconds"];
  }
  return v3;
}

- (id)description
{
  unint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SGMIMetricsInferenceAndGroundTruth;
  double v4 = [(SGMIMetricsInferenceAndGroundTruth *)&v8 description];
  uint64_t v5 = [(SGMIMetricsInferenceAndGroundTruth *)self dictionaryRepresentation];
  unint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasMissingRecipientPredictionPerformanceInMilliSeconds
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasMissingRecipientPredictionPerformanceInMilliSeconds:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)setMissingRecipientPredictionPerformanceInMilliSeconds:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_missingRecipientPredictionPerformanceInMilliSeconds = a3;
}

- (id)missingRecipientAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_missingRecipients objectAtIndex:a3];
}

- (unint64_t)missingRecipientsCount
{
  return [(NSMutableArray *)self->_missingRecipients count];
}

- (void)addMissingRecipient:(id)a3
{
  id v4 = a3;
  missingRecipients = self->_missingRecipients;
  id v8 = v4;
  if (!missingRecipients)
  {
    unint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_missingRecipients;
    self->_missingRecipients = v6;

    id v4 = v8;
    missingRecipients = self->_missingRecipients;
  }
  [(NSMutableArray *)missingRecipients addObject:v4];
}

- (void)clearMissingRecipients
{
}

- (BOOL)hasMissingAttachmentPredictionPerformanceInMilliSeconds
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasMissingAttachmentPredictionPerformanceInMilliSeconds:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setMissingAttachmentPredictionPerformanceInMilliSeconds:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_missingAttachmentPredictionPerformanceInMilliSeconds = a3;
}

- (id)missingAttachmentAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_missingAttachments objectAtIndex:a3];
}

- (unint64_t)missingAttachmentsCount
{
  return [(NSMutableArray *)self->_missingAttachments count];
}

- (void)addMissingAttachment:(id)a3
{
  id v4 = a3;
  missingAttachments = self->_missingAttachments;
  id v8 = v4;
  if (!missingAttachments)
  {
    unint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_missingAttachments;
    self->_missingAttachments = v6;

    id v4 = v8;
    missingAttachments = self->_missingAttachments;
  }
  [(NSMutableArray *)missingAttachments addObject:v4];
}

- (void)clearMissingAttachments
{
}

- (BOOL)hasEstimatedGroundTruth
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setHasEstimatedGroundTruth:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (void)setEstimatedGroundTruth:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_estimatedGroundTruth = a3;
}

- (BOOL)hasSaliencyPredictionPerformanceInMilliSeconds
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setHasSaliencyPredictionPerformanceInMilliSeconds:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (void)setSaliencyPredictionPerformanceInMilliSeconds:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_saliencyPredictionPerformanceInMilliSeconds = a3;
}

- (int)StringAsPredictedSaliency:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Salient"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"Neutral"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"Ignorable"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 1;
  }

  return v4;
}

- (id)predictedSaliencyAsString:(int)a3
{
  if ((a3 - 1) >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E65C02C0[a3 - 1];
  }
  return v3;
}

- (BOOL)hasPredictedSaliency
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setHasPredictedSaliency:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (void)setPredictedSaliency:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_predictedSaliency = a3;
}

- (int)predictedSaliency
{
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    return self->_predictedSaliency;
  }
  else {
    return 1;
  }
}

- (BOOL)hasPredictedSaliencyScore
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setHasPredictedSaliencyScore:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (void)setPredictedSaliencyScore:(float)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_float predictedSaliencyScore = a3;
}

- (BOOL)hasSubmodelsProbabilities
{
  return self->_submodelsProbabilities != 0;
}

- (BOOL)hasTrialMetadata
{
  return self->_trialMetadata != 0;
}

+ (Class)missingRecipientType
{
  return (Class)objc_opt_class();
}

+ (Class)missingAttachmentType
{
  return (Class)objc_opt_class();
}

@end