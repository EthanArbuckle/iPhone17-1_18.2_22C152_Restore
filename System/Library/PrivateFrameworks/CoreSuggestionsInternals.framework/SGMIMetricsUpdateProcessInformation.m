@interface SGMIMetricsUpdateProcessInformation
- (BOOL)hasBackgroundTrialMetadata;
- (BOOL)hasBiomeAggregationPerformanceInMilliSeconds;
- (BOOL)hasCumulatedSubmodelsRollbackForPostDeletionPolicyPerformanceInMilliSeconds;
- (BOOL)hasDaysAvailableDuringIncrementalUpdate;
- (BOOL)hasDaysProcessedDuringIncrementalUpdate;
- (BOOL)hasDeletedEmailsCount;
- (BOOL)hasDeletedTokensCountToComplyToCappingPolicy;
- (BOOL)hasHoursSinceLastIncrementalUpdate;
- (BOOL)hasHoursSinceReference;
- (BOOL)hasIsSubmodelRebuilt;
- (BOOL)hasMailsProcessedDuringIncrementalUpdate;
- (BOOL)hasRollbackedEmailsCountToComplyToPostDeletionPolicy;
- (BOOL)hasRollbackedSlicesCountToComplyToPostDeletionPolicy;
- (BOOL)hasSubmodelsPruningForCappingPolicyPerformanceInMilliSeconds;
- (BOOL)hasSubmodelsStats;
- (BOOL)hasSubmodelsUpdatePerformanceInMilliSeconds;
- (BOOL)hasTrialMetadata;
- (BOOL)isEqual:(id)a3;
- (BOOL)isSubmodelRebuilt;
- (BOOL)readFrom:(id)a3;
- (SGMIMetricsSubmodelsStats)submodelsStats;
- (SGMIMetricsTrialMetadata)backgroundTrialMetadata;
- (SGMIMetricsTrialMetadata)trialMetadata;
- (id)copyWithZone:(_NSZone *)a3;
- (id)ctsJobConstraintsAsString:(int)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)StringAsCtsJobConstraints:(id)a3;
- (int)ctsJobConstraints;
- (int)ctsJobConstraintsAtIndex:(unint64_t)a3;
- (unint64_t)biomeAggregationPerformanceInMilliSeconds;
- (unint64_t)ctsJobConstraintsCount;
- (unint64_t)cumulatedSubmodelsRollbackForPostDeletionPolicyPerformanceInMilliSeconds;
- (unint64_t)hash;
- (unint64_t)submodelsPruningForCappingPolicyPerformanceInMilliSeconds;
- (unint64_t)submodelsUpdatePerformanceInMilliSeconds;
- (unsigned)daysAvailableDuringIncrementalUpdate;
- (unsigned)daysProcessedDuringIncrementalUpdate;
- (unsigned)deletedEmailsCount;
- (unsigned)deletedTokensCountToComplyToCappingPolicy;
- (unsigned)hoursSinceLastIncrementalUpdate;
- (unsigned)hoursSinceReference;
- (unsigned)mailsProcessedDuringIncrementalUpdate;
- (unsigned)rollbackedEmailsCountToComplyToPostDeletionPolicy;
- (unsigned)rollbackedSlicesCountToComplyToPostDeletionPolicy;
- (void)addCtsJobConstraints:(int)a3;
- (void)clearCtsJobConstraints;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setBackgroundTrialMetadata:(id)a3;
- (void)setBiomeAggregationPerformanceInMilliSeconds:(unint64_t)a3;
- (void)setCtsJobConstraints:(int *)a3 count:(unint64_t)a4;
- (void)setCumulatedSubmodelsRollbackForPostDeletionPolicyPerformanceInMilliSeconds:(unint64_t)a3;
- (void)setDaysAvailableDuringIncrementalUpdate:(unsigned int)a3;
- (void)setDaysProcessedDuringIncrementalUpdate:(unsigned int)a3;
- (void)setDeletedEmailsCount:(unsigned int)a3;
- (void)setDeletedTokensCountToComplyToCappingPolicy:(unsigned int)a3;
- (void)setHasBiomeAggregationPerformanceInMilliSeconds:(BOOL)a3;
- (void)setHasCumulatedSubmodelsRollbackForPostDeletionPolicyPerformanceInMilliSeconds:(BOOL)a3;
- (void)setHasDaysAvailableDuringIncrementalUpdate:(BOOL)a3;
- (void)setHasDaysProcessedDuringIncrementalUpdate:(BOOL)a3;
- (void)setHasDeletedEmailsCount:(BOOL)a3;
- (void)setHasDeletedTokensCountToComplyToCappingPolicy:(BOOL)a3;
- (void)setHasHoursSinceLastIncrementalUpdate:(BOOL)a3;
- (void)setHasHoursSinceReference:(BOOL)a3;
- (void)setHasIsSubmodelRebuilt:(BOOL)a3;
- (void)setHasMailsProcessedDuringIncrementalUpdate:(BOOL)a3;
- (void)setHasRollbackedEmailsCountToComplyToPostDeletionPolicy:(BOOL)a3;
- (void)setHasRollbackedSlicesCountToComplyToPostDeletionPolicy:(BOOL)a3;
- (void)setHasSubmodelsPruningForCappingPolicyPerformanceInMilliSeconds:(BOOL)a3;
- (void)setHasSubmodelsUpdatePerformanceInMilliSeconds:(BOOL)a3;
- (void)setHoursSinceLastIncrementalUpdate:(unsigned int)a3;
- (void)setHoursSinceReference:(unsigned int)a3;
- (void)setIsSubmodelRebuilt:(BOOL)a3;
- (void)setMailsProcessedDuringIncrementalUpdate:(unsigned int)a3;
- (void)setRollbackedEmailsCountToComplyToPostDeletionPolicy:(unsigned int)a3;
- (void)setRollbackedSlicesCountToComplyToPostDeletionPolicy:(unsigned int)a3;
- (void)setSubmodelsPruningForCappingPolicyPerformanceInMilliSeconds:(unint64_t)a3;
- (void)setSubmodelsStats:(id)a3;
- (void)setSubmodelsUpdatePerformanceInMilliSeconds:(unint64_t)a3;
- (void)setTrialMetadata:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SGMIMetricsUpdateProcessInformation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trialMetadata, 0);
  objc_storeStrong((id *)&self->_submodelsStats, 0);
  objc_storeStrong((id *)&self->_backgroundTrialMetadata, 0);
}

- (unint64_t)cumulatedSubmodelsRollbackForPostDeletionPolicyPerformanceInMilliSeconds
{
  return self->_cumulatedSubmodelsRollbackForPostDeletionPolicyPerformanceInMilliSeconds;
}

- (unint64_t)submodelsPruningForCappingPolicyPerformanceInMilliSeconds
{
  return self->_submodelsPruningForCappingPolicyPerformanceInMilliSeconds;
}

- (unint64_t)submodelsUpdatePerformanceInMilliSeconds
{
  return self->_submodelsUpdatePerformanceInMilliSeconds;
}

- (unint64_t)biomeAggregationPerformanceInMilliSeconds
{
  return self->_biomeAggregationPerformanceInMilliSeconds;
}

- (void)setSubmodelsStats:(id)a3
{
}

- (SGMIMetricsSubmodelsStats)submodelsStats
{
  return self->_submodelsStats;
}

- (unsigned)rollbackedEmailsCountToComplyToPostDeletionPolicy
{
  return self->_rollbackedEmailsCountToComplyToPostDeletionPolicy;
}

- (unsigned)rollbackedSlicesCountToComplyToPostDeletionPolicy
{
  return self->_rollbackedSlicesCountToComplyToPostDeletionPolicy;
}

- (unsigned)deletedEmailsCount
{
  return self->_deletedEmailsCount;
}

- (unsigned)deletedTokensCountToComplyToCappingPolicy
{
  return self->_deletedTokensCountToComplyToCappingPolicy;
}

- (unsigned)mailsProcessedDuringIncrementalUpdate
{
  return self->_mailsProcessedDuringIncrementalUpdate;
}

- (unsigned)daysProcessedDuringIncrementalUpdate
{
  return self->_daysProcessedDuringIncrementalUpdate;
}

- (unsigned)daysAvailableDuringIncrementalUpdate
{
  return self->_daysAvailableDuringIncrementalUpdate;
}

- (BOOL)isSubmodelRebuilt
{
  return self->_isSubmodelRebuilt;
}

- (unsigned)hoursSinceLastIncrementalUpdate
{
  return self->_hoursSinceLastIncrementalUpdate;
}

- (unsigned)hoursSinceReference
{
  return self->_hoursSinceReference;
}

- (void)setBackgroundTrialMetadata:(id)a3
{
}

- (SGMIMetricsTrialMetadata)backgroundTrialMetadata
{
  return self->_backgroundTrialMetadata;
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
  id v4 = a3;
  trialMetadata = self->_trialMetadata;
  uint64_t v6 = *((void *)v4 + 15);
  id v17 = v4;
  if (trialMetadata)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[SGMIMetricsTrialMetadata mergeFrom:](trialMetadata, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[SGMIMetricsUpdateProcessInformation setTrialMetadata:](self, "setTrialMetadata:");
  }
  id v4 = v17;
LABEL_7:
  backgroundTrialMetadata = self->_backgroundTrialMetadata;
  uint64_t v8 = *((void *)v4 + 8);
  if (backgroundTrialMetadata)
  {
    if (!v8) {
      goto LABEL_13;
    }
    -[SGMIMetricsTrialMetadata mergeFrom:](backgroundTrialMetadata, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_13;
    }
    -[SGMIMetricsUpdateProcessInformation setBackgroundTrialMetadata:](self, "setBackgroundTrialMetadata:");
  }
  id v4 = v17;
LABEL_13:
  if ((*((_WORD *)v4 + 66) & 0x200) != 0)
  {
    self->_hoursSinceReference = *((_DWORD *)v4 + 23);
    *(_WORD *)&self->_has |= 0x200u;
  }
  uint64_t v9 = [v4 ctsJobConstraintsCount];
  if (v9)
  {
    uint64_t v10 = v9;
    for (uint64_t i = 0; i != v10; ++i)
      -[SGMIMetricsUpdateProcessInformation addCtsJobConstraints:](self, "addCtsJobConstraints:", [v17 ctsJobConstraintsAtIndex:i]);
  }
  id v12 = v17;
  __int16 v13 = *((_WORD *)v17 + 66);
  if ((v13 & 0x100) != 0)
  {
    self->_hoursSinceLastIncrementalUpdate = *((_DWORD *)v17 + 22);
    *(_WORD *)&self->_has |= 0x100u;
    __int16 v13 = *((_WORD *)v17 + 66);
    if ((v13 & 0x2000) == 0)
    {
LABEL_20:
      if ((v13 & 0x10) == 0) {
        goto LABEL_21;
      }
      goto LABEL_33;
    }
  }
  else if ((*((_WORD *)v17 + 66) & 0x2000) == 0)
  {
    goto LABEL_20;
  }
  self->_isSubmodelRebuilt = *((unsigned char *)v17 + 128);
  *(_WORD *)&self->_has |= 0x2000u;
  __int16 v13 = *((_WORD *)v17 + 66);
  if ((v13 & 0x10) == 0)
  {
LABEL_21:
    if ((v13 & 0x20) == 0) {
      goto LABEL_22;
    }
    goto LABEL_34;
  }
LABEL_33:
  self->_daysAvailableDuringIncrementalUpdate = *((_DWORD *)v17 + 18);
  *(_WORD *)&self->_has |= 0x10u;
  __int16 v13 = *((_WORD *)v17 + 66);
  if ((v13 & 0x20) == 0)
  {
LABEL_22:
    if ((v13 & 0x400) == 0) {
      goto LABEL_23;
    }
    goto LABEL_35;
  }
LABEL_34:
  self->_daysProcessedDuringIncrementalUpdate = *((_DWORD *)v17 + 19);
  *(_WORD *)&self->_has |= 0x20u;
  __int16 v13 = *((_WORD *)v17 + 66);
  if ((v13 & 0x400) == 0)
  {
LABEL_23:
    if ((v13 & 0x80) == 0) {
      goto LABEL_24;
    }
    goto LABEL_36;
  }
LABEL_35:
  self->_mailsProcessedDuringIncrementalUpdate = *((_DWORD *)v17 + 24);
  *(_WORD *)&self->_has |= 0x400u;
  __int16 v13 = *((_WORD *)v17 + 66);
  if ((v13 & 0x80) == 0)
  {
LABEL_24:
    if ((v13 & 0x40) == 0) {
      goto LABEL_25;
    }
    goto LABEL_37;
  }
LABEL_36:
  self->_deletedTokensCountToComplyToCappingPolicy = *((_DWORD *)v17 + 21);
  *(_WORD *)&self->_has |= 0x80u;
  __int16 v13 = *((_WORD *)v17 + 66);
  if ((v13 & 0x40) == 0)
  {
LABEL_25:
    if ((v13 & 0x1000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_38;
  }
LABEL_37:
  self->_deletedEmailsCount = *((_DWORD *)v17 + 20);
  *(_WORD *)&self->_has |= 0x40u;
  __int16 v13 = *((_WORD *)v17 + 66);
  if ((v13 & 0x1000) == 0)
  {
LABEL_26:
    if ((v13 & 0x800) == 0) {
      goto LABEL_28;
    }
    goto LABEL_27;
  }
LABEL_38:
  self->_rollbackedSlicesCountToComplyToPostDeletionPolicy = *((_DWORD *)v17 + 26);
  *(_WORD *)&self->_has |= 0x1000u;
  if ((*((_WORD *)v17 + 66) & 0x800) != 0)
  {
LABEL_27:
    self->_rollbackedEmailsCountToComplyToPostDeletionPolicy = *((_DWORD *)v17 + 25);
    *(_WORD *)&self->_has |= 0x800u;
  }
LABEL_28:
  submodelsStats = self->_submodelsStats;
  uint64_t v15 = *((void *)v17 + 14);
  if (submodelsStats)
  {
    if (!v15) {
      goto LABEL_43;
    }
    -[SGMIMetricsSubmodelsStats mergeFrom:](submodelsStats, "mergeFrom:");
  }
  else
  {
    if (!v15) {
      goto LABEL_43;
    }
    -[SGMIMetricsUpdateProcessInformation setSubmodelsStats:](self, "setSubmodelsStats:");
  }
  id v12 = v17;
LABEL_43:
  __int16 v16 = *((_WORD *)v12 + 66);
  if (v16)
  {
    self->_biomeAggregationPerformanceInMilliSeconds = *((void *)v12 + 4);
    *(_WORD *)&self->_has |= 1u;
    __int16 v16 = *((_WORD *)v12 + 66);
    if ((v16 & 8) == 0)
    {
LABEL_45:
      if ((v16 & 4) == 0) {
        goto LABEL_46;
      }
      goto LABEL_53;
    }
  }
  else if ((v16 & 8) == 0)
  {
    goto LABEL_45;
  }
  self->_submodelsUpdatePerformanceInMilliSeconds = *((void *)v12 + 7);
  *(_WORD *)&self->_has |= 8u;
  __int16 v16 = *((_WORD *)v12 + 66);
  if ((v16 & 4) == 0)
  {
LABEL_46:
    if ((v16 & 2) == 0) {
      goto LABEL_48;
    }
    goto LABEL_47;
  }
LABEL_53:
  self->_submodelsPruningForCappingPolicyPerformanceInMilliSeconds = *((void *)v12 + 6);
  *(_WORD *)&self->_has |= 4u;
  if ((*((_WORD *)v12 + 66) & 2) != 0)
  {
LABEL_47:
    self->_cumulatedSubmodelsRollbackForPostDeletionPolicyPerformanceInMilliSeconds = *((void *)v12 + 5);
    *(_WORD *)&self->_has |= 2u;
  }
LABEL_48:
  MEMORY[0x1F41817F8]();
}

- (unint64_t)hash
{
  unint64_t v24 = [(SGMIMetricsTrialMetadata *)self->_trialMetadata hash];
  unint64_t v23 = [(SGMIMetricsTrialMetadata *)self->_backgroundTrialMetadata hash];
  if ((*(_WORD *)&self->_has & 0x200) != 0) {
    uint64_t v22 = 2654435761 * self->_hoursSinceReference;
  }
  else {
    uint64_t v22 = 0;
  }
  uint64_t v21 = PBRepeatedInt32Hash();
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) != 0)
  {
    uint64_t v20 = 2654435761 * self->_hoursSinceLastIncrementalUpdate;
    if ((*(_WORD *)&self->_has & 0x2000) != 0)
    {
LABEL_6:
      uint64_t v18 = 2654435761 * self->_isSubmodelRebuilt;
      if ((has & 0x10) != 0) {
        goto LABEL_7;
      }
      goto LABEL_16;
    }
  }
  else
  {
    uint64_t v20 = 0;
    if ((*(_WORD *)&self->_has & 0x2000) != 0) {
      goto LABEL_6;
    }
  }
  uint64_t v18 = 0;
  if ((has & 0x10) != 0)
  {
LABEL_7:
    uint64_t v4 = 2654435761 * self->_daysAvailableDuringIncrementalUpdate;
    if ((has & 0x20) != 0) {
      goto LABEL_8;
    }
    goto LABEL_17;
  }
LABEL_16:
  uint64_t v4 = 0;
  if ((has & 0x20) != 0)
  {
LABEL_8:
    uint64_t v5 = 2654435761 * self->_daysProcessedDuringIncrementalUpdate;
    if ((*(_WORD *)&self->_has & 0x400) != 0) {
      goto LABEL_9;
    }
    goto LABEL_18;
  }
LABEL_17:
  uint64_t v5 = 0;
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
LABEL_9:
    uint64_t v6 = 2654435761 * self->_mailsProcessedDuringIncrementalUpdate;
    if ((has & 0x80) != 0) {
      goto LABEL_10;
    }
    goto LABEL_19;
  }
LABEL_18:
  uint64_t v6 = 0;
  if ((has & 0x80) != 0)
  {
LABEL_10:
    uint64_t v7 = 2654435761 * self->_deletedTokensCountToComplyToCappingPolicy;
    if ((has & 0x40) != 0) {
      goto LABEL_11;
    }
    goto LABEL_20;
  }
LABEL_19:
  uint64_t v7 = 0;
  if ((has & 0x40) != 0)
  {
LABEL_11:
    uint64_t v8 = 2654435761 * self->_deletedEmailsCount;
    if ((*(_WORD *)&self->_has & 0x1000) != 0) {
      goto LABEL_12;
    }
LABEL_21:
    uint64_t v9 = 0;
    if ((*(_WORD *)&self->_has & 0x800) != 0) {
      goto LABEL_13;
    }
    goto LABEL_22;
  }
LABEL_20:
  uint64_t v8 = 0;
  if ((*(_WORD *)&self->_has & 0x1000) == 0) {
    goto LABEL_21;
  }
LABEL_12:
  uint64_t v9 = 2654435761 * self->_rollbackedSlicesCountToComplyToPostDeletionPolicy;
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
LABEL_13:
    uint64_t v10 = 2654435761 * self->_rollbackedEmailsCountToComplyToPostDeletionPolicy;
    goto LABEL_23;
  }
LABEL_22:
  uint64_t v10 = 0;
LABEL_23:
  unint64_t v11 = [(SGMIMetricsSubmodelsStats *)self->_submodelsStats hash];
  __int16 v12 = (__int16)self->_has;
  if (v12)
  {
    unint64_t v13 = 2654435761u * self->_biomeAggregationPerformanceInMilliSeconds;
    if ((v12 & 8) != 0)
    {
LABEL_25:
      unint64_t v14 = 2654435761u * self->_submodelsUpdatePerformanceInMilliSeconds;
      if ((v12 & 4) != 0) {
        goto LABEL_26;
      }
LABEL_30:
      unint64_t v15 = 0;
      if ((v12 & 2) != 0) {
        goto LABEL_27;
      }
LABEL_31:
      unint64_t v16 = 0;
      return v23 ^ v24 ^ v22 ^ v21 ^ v20 ^ v19 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v13 ^ v14 ^ v15 ^ v16;
    }
  }
  else
  {
    unint64_t v13 = 0;
    if ((v12 & 8) != 0) {
      goto LABEL_25;
    }
  }
  unint64_t v14 = 0;
  if ((v12 & 4) == 0) {
    goto LABEL_30;
  }
LABEL_26:
  unint64_t v15 = 2654435761u * self->_submodelsPruningForCappingPolicyPerformanceInMilliSeconds;
  if ((v12 & 2) == 0) {
    goto LABEL_31;
  }
LABEL_27:
  unint64_t v16 = 2654435761u * self->_cumulatedSubmodelsRollbackForPostDeletionPolicyPerformanceInMilliSeconds;
  return v23 ^ v24 ^ v22 ^ v21 ^ v20 ^ v19 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v13 ^ v14 ^ v15 ^ v16;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_83;
  }
  trialMetadata = self->_trialMetadata;
  if ((unint64_t)trialMetadata | *((void *)v4 + 15))
  {
    if (!-[SGMIMetricsTrialMetadata isEqual:](trialMetadata, "isEqual:")) {
      goto LABEL_83;
    }
  }
  backgroundTrialMetadata = self->_backgroundTrialMetadata;
  if ((unint64_t)backgroundTrialMetadata | *((void *)v4 + 8))
  {
    if (!-[SGMIMetricsTrialMetadata isEqual:](backgroundTrialMetadata, "isEqual:")) {
      goto LABEL_83;
    }
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 66) & 0x200) == 0 || self->_hoursSinceReference != *((_DWORD *)v4 + 23)) {
      goto LABEL_83;
    }
  }
  else if ((*((_WORD *)v4 + 66) & 0x200) != 0)
  {
    goto LABEL_83;
  }
  if (!PBRepeatedInt32IsEqual()) {
    goto LABEL_83;
  }
  __int16 has = (__int16)self->_has;
  __int16 v8 = *((_WORD *)v4 + 66);
  if ((has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 66) & 0x100) == 0 || self->_hoursSinceLastIncrementalUpdate != *((_DWORD *)v4 + 22)) {
      goto LABEL_83;
    }
  }
  else if ((*((_WORD *)v4 + 66) & 0x100) != 0)
  {
    goto LABEL_83;
  }
  if ((*(_WORD *)&self->_has & 0x2000) != 0)
  {
    if ((*((_WORD *)v4 + 66) & 0x2000) == 0) {
      goto LABEL_83;
    }
    if (self->_isSubmodelRebuilt)
    {
      if (!*((unsigned char *)v4 + 128)) {
        goto LABEL_83;
      }
    }
    else if (*((unsigned char *)v4 + 128))
    {
      goto LABEL_83;
    }
  }
  else if ((*((_WORD *)v4 + 66) & 0x2000) != 0)
  {
    goto LABEL_83;
  }
  if ((has & 0x10) != 0)
  {
    if ((v8 & 0x10) == 0 || self->_daysAvailableDuringIncrementalUpdate != *((_DWORD *)v4 + 18)) {
      goto LABEL_83;
    }
  }
  else if ((v8 & 0x10) != 0)
  {
    goto LABEL_83;
  }
  if ((has & 0x20) != 0)
  {
    if ((v8 & 0x20) == 0 || self->_daysProcessedDuringIncrementalUpdate != *((_DWORD *)v4 + 19)) {
      goto LABEL_83;
    }
  }
  else if ((v8 & 0x20) != 0)
  {
    goto LABEL_83;
  }
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    if ((*((_WORD *)v4 + 66) & 0x400) == 0 || self->_mailsProcessedDuringIncrementalUpdate != *((_DWORD *)v4 + 24)) {
      goto LABEL_83;
    }
  }
  else if ((*((_WORD *)v4 + 66) & 0x400) != 0)
  {
    goto LABEL_83;
  }
  if ((has & 0x80) != 0)
  {
    if ((v8 & 0x80) == 0 || self->_deletedTokensCountToComplyToCappingPolicy != *((_DWORD *)v4 + 21)) {
      goto LABEL_83;
    }
  }
  else if ((v8 & 0x80) != 0)
  {
    goto LABEL_83;
  }
  if ((has & 0x40) != 0)
  {
    if ((v8 & 0x40) == 0 || self->_deletedEmailsCount != *((_DWORD *)v4 + 20)) {
      goto LABEL_83;
    }
  }
  else if ((v8 & 0x40) != 0)
  {
    goto LABEL_83;
  }
  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
    if ((*((_WORD *)v4 + 66) & 0x1000) == 0
      || self->_rollbackedSlicesCountToComplyToPostDeletionPolicy != *((_DWORD *)v4 + 26))
    {
      goto LABEL_83;
    }
  }
  else if ((*((_WORD *)v4 + 66) & 0x1000) != 0)
  {
    goto LABEL_83;
  }
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
    if ((*((_WORD *)v4 + 66) & 0x800) == 0
      || self->_rollbackedEmailsCountToComplyToPostDeletionPolicy != *((_DWORD *)v4 + 25))
    {
      goto LABEL_83;
    }
  }
  else if ((*((_WORD *)v4 + 66) & 0x800) != 0)
  {
    goto LABEL_83;
  }
  submodelsStats = self->_submodelsStats;
  if ((unint64_t)submodelsStats | *((void *)v4 + 14))
  {
    if (-[SGMIMetricsSubmodelsStats isEqual:](submodelsStats, "isEqual:"))
    {
      __int16 has = (__int16)self->_has;
      __int16 v8 = *((_WORD *)v4 + 66);
      goto LABEL_63;
    }
LABEL_83:
    BOOL v10 = 0;
    goto LABEL_84;
  }
LABEL_63:
  if (has)
  {
    if ((v8 & 1) == 0 || self->_biomeAggregationPerformanceInMilliSeconds != *((void *)v4 + 4)) {
      goto LABEL_83;
    }
  }
  else if (v8)
  {
    goto LABEL_83;
  }
  if ((has & 8) != 0)
  {
    if ((v8 & 8) == 0 || self->_submodelsUpdatePerformanceInMilliSeconds != *((void *)v4 + 7)) {
      goto LABEL_83;
    }
  }
  else if ((v8 & 8) != 0)
  {
    goto LABEL_83;
  }
  if ((has & 4) != 0)
  {
    if ((v8 & 4) == 0 || self->_submodelsPruningForCappingPolicyPerformanceInMilliSeconds != *((void *)v4 + 6)) {
      goto LABEL_83;
    }
  }
  else if ((v8 & 4) != 0)
  {
    goto LABEL_83;
  }
  if ((has & 2) != 0)
  {
    if ((v8 & 2) == 0
      || self->_cumulatedSubmodelsRollbackForPostDeletionPolicyPerformanceInMilliSeconds != *((void *)v4 + 5))
    {
      goto LABEL_83;
    }
    BOOL v10 = 1;
  }
  else
  {
    BOOL v10 = (v8 & 2) == 0;
  }
LABEL_84:

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(SGMIMetricsTrialMetadata *)self->_trialMetadata copyWithZone:a3];
  uint64_t v7 = *(void **)(v5 + 120);
  *(void *)(v5 + 120) = v6;

  id v8 = [(SGMIMetricsTrialMetadata *)self->_backgroundTrialMetadata copyWithZone:a3];
  uint64_t v9 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v8;

  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    *(_DWORD *)(v5 + 92) = self->_hoursSinceReference;
    *(_WORD *)(v5 + 132) |= 0x200u;
  }
  PBRepeatedInt32Copy();
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) != 0)
  {
    *(_DWORD *)(v5 + 88) = self->_hoursSinceLastIncrementalUpdate;
    *(_WORD *)(v5 + 132) |= 0x100u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x2000) == 0)
    {
LABEL_5:
      if ((has & 0x10) == 0) {
        goto LABEL_6;
      }
      goto LABEL_21;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x2000) == 0)
  {
    goto LABEL_5;
  }
  *(unsigned char *)(v5 + 128) = self->_isSubmodelRebuilt;
  *(_WORD *)(v5 + 132) |= 0x2000u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_22;
  }
LABEL_21:
  *(_DWORD *)(v5 + 72) = self->_daysAvailableDuringIncrementalUpdate;
  *(_WORD *)(v5 + 132) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 0x400) == 0) {
      goto LABEL_8;
    }
    goto LABEL_23;
  }
LABEL_22:
  *(_DWORD *)(v5 + 76) = self->_daysProcessedDuringIncrementalUpdate;
  *(_WORD *)(v5 + 132) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_8:
    if ((has & 0x80) == 0) {
      goto LABEL_9;
    }
    goto LABEL_24;
  }
LABEL_23:
  *(_DWORD *)(v5 + 96) = self->_mailsProcessedDuringIncrementalUpdate;
  *(_WORD *)(v5 + 132) |= 0x400u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_9:
    if ((has & 0x40) == 0) {
      goto LABEL_10;
    }
    goto LABEL_25;
  }
LABEL_24:
  *(_DWORD *)(v5 + 84) = self->_deletedTokensCountToComplyToCappingPolicy;
  *(_WORD *)(v5 + 132) |= 0x80u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_10:
    if ((has & 0x1000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_26;
  }
LABEL_25:
  *(_DWORD *)(v5 + 80) = self->_deletedEmailsCount;
  *(_WORD *)(v5 + 132) |= 0x40u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_11:
    if ((has & 0x800) == 0) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
LABEL_26:
  *(_DWORD *)(v5 + 104) = self->_rollbackedSlicesCountToComplyToPostDeletionPolicy;
  *(_WORD *)(v5 + 132) |= 0x1000u;
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
LABEL_12:
    *(_DWORD *)(v5 + 100) = self->_rollbackedEmailsCountToComplyToPostDeletionPolicy;
    *(_WORD *)(v5 + 132) |= 0x800u;
  }
LABEL_13:
  id v11 = [(SGMIMetricsSubmodelsStats *)self->_submodelsStats copyWithZone:a3];
  __int16 v12 = *(void **)(v5 + 112);
  *(void *)(v5 + 112) = v11;

  __int16 v13 = (__int16)self->_has;
  if (v13)
  {
    *(void *)(v5 + 32) = self->_biomeAggregationPerformanceInMilliSeconds;
    *(_WORD *)(v5 + 132) |= 1u;
    __int16 v13 = (__int16)self->_has;
    if ((v13 & 8) == 0)
    {
LABEL_15:
      if ((v13 & 4) == 0) {
        goto LABEL_16;
      }
LABEL_30:
      *(void *)(v5 + 48) = self->_submodelsPruningForCappingPolicyPerformanceInMilliSeconds;
      *(_WORD *)(v5 + 132) |= 4u;
      if ((*(_WORD *)&self->_has & 2) == 0) {
        return (id)v5;
      }
      goto LABEL_17;
    }
  }
  else if ((v13 & 8) == 0)
  {
    goto LABEL_15;
  }
  *(void *)(v5 + 56) = self->_submodelsUpdatePerformanceInMilliSeconds;
  *(_WORD *)(v5 + 132) |= 8u;
  __int16 v13 = (__int16)self->_has;
  if ((v13 & 4) != 0) {
    goto LABEL_30;
  }
LABEL_16:
  if ((v13 & 2) != 0)
  {
LABEL_17:
    *(void *)(v5 + 40) = self->_cumulatedSubmodelsRollbackForPostDeletionPolicyPerformanceInMilliSeconds;
    *(_WORD *)(v5 + 132) |= 2u;
  }
  return (id)v5;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v11 = v4;
  if (self->_trialMetadata)
  {
    objc_msgSend(v4, "setTrialMetadata:");
    id v4 = v11;
  }
  if (self->_backgroundTrialMetadata)
  {
    objc_msgSend(v11, "setBackgroundTrialMetadata:");
    id v4 = v11;
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    *((_DWORD *)v4 + 23) = self->_hoursSinceReference;
    *((_WORD *)v4 + 66) |= 0x200u;
  }
  if ([(SGMIMetricsUpdateProcessInformation *)self ctsJobConstraintsCount])
  {
    [v11 clearCtsJobConstraints];
    unint64_t v5 = [(SGMIMetricsUpdateProcessInformation *)self ctsJobConstraintsCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
        objc_msgSend(v11, "addCtsJobConstraints:", -[SGMIMetricsUpdateProcessInformation ctsJobConstraintsAtIndex:](self, "ctsJobConstraintsAtIndex:", i));
    }
  }
  __int16 has = (__int16)self->_has;
  uint64_t v9 = v11;
  if ((has & 0x100) != 0)
  {
    *((_DWORD *)v11 + 22) = self->_hoursSinceLastIncrementalUpdate;
    *((_WORD *)v11 + 66) |= 0x100u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x2000) == 0)
    {
LABEL_13:
      if ((has & 0x10) == 0) {
        goto LABEL_14;
      }
      goto LABEL_33;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x2000) == 0)
  {
    goto LABEL_13;
  }
  *((unsigned char *)v11 + 128) = self->_isSubmodelRebuilt;
  *((_WORD *)v11 + 66) |= 0x2000u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_14:
    if ((has & 0x20) == 0) {
      goto LABEL_15;
    }
    goto LABEL_34;
  }
LABEL_33:
  *((_DWORD *)v11 + 18) = self->_daysAvailableDuringIncrementalUpdate;
  *((_WORD *)v11 + 66) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_15:
    if ((has & 0x400) == 0) {
      goto LABEL_16;
    }
    goto LABEL_35;
  }
LABEL_34:
  *((_DWORD *)v11 + 19) = self->_daysProcessedDuringIncrementalUpdate;
  *((_WORD *)v11 + 66) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_16:
    if ((has & 0x80) == 0) {
      goto LABEL_17;
    }
    goto LABEL_36;
  }
LABEL_35:
  *((_DWORD *)v11 + 24) = self->_mailsProcessedDuringIncrementalUpdate;
  *((_WORD *)v11 + 66) |= 0x400u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_17:
    if ((has & 0x40) == 0) {
      goto LABEL_18;
    }
    goto LABEL_37;
  }
LABEL_36:
  *((_DWORD *)v11 + 21) = self->_deletedTokensCountToComplyToCappingPolicy;
  *((_WORD *)v11 + 66) |= 0x80u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_18:
    if ((has & 0x1000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_38;
  }
LABEL_37:
  *((_DWORD *)v11 + 20) = self->_deletedEmailsCount;
  *((_WORD *)v11 + 66) |= 0x40u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_19:
    if ((has & 0x800) == 0) {
      goto LABEL_21;
    }
    goto LABEL_20;
  }
LABEL_38:
  *((_DWORD *)v11 + 26) = self->_rollbackedSlicesCountToComplyToPostDeletionPolicy;
  *((_WORD *)v11 + 66) |= 0x1000u;
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
LABEL_20:
    *((_DWORD *)v11 + 25) = self->_rollbackedEmailsCountToComplyToPostDeletionPolicy;
    *((_WORD *)v11 + 66) |= 0x800u;
  }
LABEL_21:
  if (self->_submodelsStats)
  {
    objc_msgSend(v11, "setSubmodelsStats:");
    uint64_t v9 = v11;
  }
  __int16 v10 = (__int16)self->_has;
  if (v10)
  {
    v9[4] = self->_biomeAggregationPerformanceInMilliSeconds;
    *((_WORD *)v9 + 66) |= 1u;
    __int16 v10 = (__int16)self->_has;
    if ((v10 & 8) == 0)
    {
LABEL_25:
      if ((v10 & 4) == 0) {
        goto LABEL_26;
      }
      goto LABEL_42;
    }
  }
  else if ((v10 & 8) == 0)
  {
    goto LABEL_25;
  }
  v9[7] = self->_submodelsUpdatePerformanceInMilliSeconds;
  *((_WORD *)v9 + 66) |= 8u;
  __int16 v10 = (__int16)self->_has;
  if ((v10 & 4) == 0)
  {
LABEL_26:
    if ((v10 & 2) == 0) {
      goto LABEL_28;
    }
    goto LABEL_27;
  }
LABEL_42:
  v9[6] = self->_submodelsPruningForCappingPolicyPerformanceInMilliSeconds;
  *((_WORD *)v9 + 66) |= 4u;
  if ((*(_WORD *)&self->_has & 2) != 0)
  {
LABEL_27:
    v9[5] = self->_cumulatedSubmodelsRollbackForPostDeletionPolicyPerformanceInMilliSeconds;
    *((_WORD *)v9 + 66) |= 2u;
  }
LABEL_28:
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v8 = v4;
  if (self->_trialMetadata)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v8;
  }
  if (self->_backgroundTrialMetadata)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v8;
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v8;
  }
  if (self->_ctsJobConstraints.count)
  {
    unint64_t v5 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      id v4 = v8;
      ++v5;
    }
    while (v5 < self->_ctsJobConstraints.count);
  }
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) != 0)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v8;
    __int16 has = (__int16)self->_has;
    if ((has & 0x2000) == 0)
    {
LABEL_12:
      if ((has & 0x10) == 0) {
        goto LABEL_13;
      }
      goto LABEL_32;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x2000) == 0)
  {
    goto LABEL_12;
  }
  PBDataWriterWriteBOOLField();
  id v4 = v8;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_13:
    if ((has & 0x20) == 0) {
      goto LABEL_14;
    }
    goto LABEL_33;
  }
LABEL_32:
  PBDataWriterWriteUint32Field();
  id v4 = v8;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_14:
    if ((has & 0x400) == 0) {
      goto LABEL_15;
    }
    goto LABEL_34;
  }
LABEL_33:
  PBDataWriterWriteUint32Field();
  id v4 = v8;
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_15:
    if ((has & 0x80) == 0) {
      goto LABEL_16;
    }
    goto LABEL_35;
  }
LABEL_34:
  PBDataWriterWriteUint32Field();
  id v4 = v8;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_16:
    if ((has & 0x40) == 0) {
      goto LABEL_17;
    }
    goto LABEL_36;
  }
LABEL_35:
  PBDataWriterWriteUint32Field();
  id v4 = v8;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_17:
    if ((has & 0x1000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_37;
  }
LABEL_36:
  PBDataWriterWriteUint32Field();
  id v4 = v8;
  __int16 has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_18:
    if ((has & 0x800) == 0) {
      goto LABEL_20;
    }
    goto LABEL_19;
  }
LABEL_37:
  PBDataWriterWriteUint32Field();
  id v4 = v8;
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
LABEL_19:
    PBDataWriterWriteUint32Field();
    id v4 = v8;
  }
LABEL_20:
  if (self->_submodelsStats)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v8;
  }
  __int16 v7 = (__int16)self->_has;
  if (v7)
  {
    PBDataWriterWriteUint64Field();
    id v4 = v8;
    __int16 v7 = (__int16)self->_has;
    if ((v7 & 8) == 0)
    {
LABEL_24:
      if ((v7 & 4) == 0) {
        goto LABEL_25;
      }
      goto LABEL_41;
    }
  }
  else if ((v7 & 8) == 0)
  {
    goto LABEL_24;
  }
  PBDataWriterWriteUint64Field();
  id v4 = v8;
  __int16 v7 = (__int16)self->_has;
  if ((v7 & 4) == 0)
  {
LABEL_25:
    if ((v7 & 2) == 0) {
      goto LABEL_27;
    }
    goto LABEL_26;
  }
LABEL_41:
  PBDataWriterWriteUint64Field();
  id v4 = v8;
  if ((*(_WORD *)&self->_has & 2) != 0)
  {
LABEL_26:
    PBDataWriterWriteUint64Field();
    id v4 = v8;
  }
LABEL_27:
}

- (BOOL)readFrom:(id)a3
{
  return SGMIMetricsUpdateProcessInformationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  trialMetadata = self->_trialMetadata;
  if (trialMetadata)
  {
    unint64_t v5 = [(SGMIMetricsTrialMetadata *)trialMetadata dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"trialMetadata"];
  }
  backgroundTrialMetadata = self->_backgroundTrialMetadata;
  if (backgroundTrialMetadata)
  {
    __int16 v7 = [(SGMIMetricsTrialMetadata *)backgroundTrialMetadata dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"backgroundTrialMetadata"];
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    id v8 = [NSNumber numberWithUnsignedInt:self->_hoursSinceReference];
    [v3 setObject:v8 forKey:@"hoursSinceReference"];
  }
  p_ctsJobConstraints = &self->_ctsJobConstraints;
  if (self->_ctsJobConstraints.count)
  {
    __int16 v10 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:");
    if (self->_ctsJobConstraints.count)
    {
      unint64_t v11 = 0;
      do
      {
        unsigned int v12 = p_ctsJobConstraints->list[v11] - 1;
        if (v12 >= 0x11)
        {
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", p_ctsJobConstraints->list[v11]);
          __int16 v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          __int16 v13 = off_1E65B5790[v12];
        }
        [v10 addObject:v13];

        ++v11;
      }
      while (v11 < self->_ctsJobConstraints.count);
    }
    [v3 setObject:v10 forKey:@"ctsJobConstraints"];
  }
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) != 0)
  {
    uint64_t v21 = [NSNumber numberWithUnsignedInt:self->_hoursSinceLastIncrementalUpdate];
    [v3 setObject:v21 forKey:@"hoursSinceLastIncrementalUpdate"];

    __int16 has = (__int16)self->_has;
    if ((has & 0x2000) == 0)
    {
LABEL_17:
      if ((has & 0x10) == 0) {
        goto LABEL_18;
      }
      goto LABEL_37;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x2000) == 0)
  {
    goto LABEL_17;
  }
  uint64_t v22 = [NSNumber numberWithBool:self->_isSubmodelRebuilt];
  [v3 setObject:v22 forKey:@"isSubmodelRebuilt"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_18:
    if ((has & 0x20) == 0) {
      goto LABEL_19;
    }
    goto LABEL_38;
  }
LABEL_37:
  unint64_t v23 = [NSNumber numberWithUnsignedInt:self->_daysAvailableDuringIncrementalUpdate];
  [v3 setObject:v23 forKey:@"daysAvailableDuringIncrementalUpdate"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_19:
    if ((has & 0x400) == 0) {
      goto LABEL_20;
    }
    goto LABEL_39;
  }
LABEL_38:
  unint64_t v24 = [NSNumber numberWithUnsignedInt:self->_daysProcessedDuringIncrementalUpdate];
  [v3 setObject:v24 forKey:@"daysProcessedDuringIncrementalUpdate"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_20:
    if ((has & 0x80) == 0) {
      goto LABEL_21;
    }
    goto LABEL_40;
  }
LABEL_39:
  v25 = [NSNumber numberWithUnsignedInt:self->_mailsProcessedDuringIncrementalUpdate];
  [v3 setObject:v25 forKey:@"mailsProcessedDuringIncrementalUpdate"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_21:
    if ((has & 0x40) == 0) {
      goto LABEL_22;
    }
    goto LABEL_41;
  }
LABEL_40:
  v26 = [NSNumber numberWithUnsignedInt:self->_deletedTokensCountToComplyToCappingPolicy];
  [v3 setObject:v26 forKey:@"deletedTokensCountToComplyToCappingPolicy"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_22:
    if ((has & 0x1000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_42;
  }
LABEL_41:
  v27 = [NSNumber numberWithUnsignedInt:self->_deletedEmailsCount];
  [v3 setObject:v27 forKey:@"deletedEmailsCount"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_23:
    if ((has & 0x800) == 0) {
      goto LABEL_25;
    }
    goto LABEL_24;
  }
LABEL_42:
  v28 = [NSNumber numberWithUnsignedInt:self->_rollbackedSlicesCountToComplyToPostDeletionPolicy];
  [v3 setObject:v28 forKey:@"rollbackedSlicesCountToComplyToPostDeletionPolicy"];

  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
LABEL_24:
    unint64_t v15 = [NSNumber numberWithUnsignedInt:self->_rollbackedEmailsCountToComplyToPostDeletionPolicy];
    [v3 setObject:v15 forKey:@"rollbackedEmailsCountToComplyToPostDeletionPolicy"];
  }
LABEL_25:
  submodelsStats = self->_submodelsStats;
  if (submodelsStats)
  {
    id v17 = [(SGMIMetricsSubmodelsStats *)submodelsStats dictionaryRepresentation];
    [v3 setObject:v17 forKey:@"submodelsStats"];
  }
  __int16 v18 = (__int16)self->_has;
  if (v18)
  {
    v29 = [NSNumber numberWithUnsignedLongLong:self->_biomeAggregationPerformanceInMilliSeconds];
    [v3 setObject:v29 forKey:@"biomeAggregationPerformanceInMilliSeconds"];

    __int16 v18 = (__int16)self->_has;
    if ((v18 & 8) == 0)
    {
LABEL_29:
      if ((v18 & 4) == 0) {
        goto LABEL_30;
      }
      goto LABEL_46;
    }
  }
  else if ((v18 & 8) == 0)
  {
    goto LABEL_29;
  }
  v30 = [NSNumber numberWithUnsignedLongLong:self->_submodelsUpdatePerformanceInMilliSeconds];
  [v3 setObject:v30 forKey:@"submodelsUpdatePerformanceInMilliSeconds"];

  __int16 v18 = (__int16)self->_has;
  if ((v18 & 4) == 0)
  {
LABEL_30:
    if ((v18 & 2) == 0) {
      goto LABEL_32;
    }
    goto LABEL_31;
  }
LABEL_46:
  v31 = [NSNumber numberWithUnsignedLongLong:self->_submodelsPruningForCappingPolicyPerformanceInMilliSeconds];
  [v3 setObject:v31 forKey:@"submodelsPruningForCappingPolicyPerformanceInMilliSeconds"];

  if ((*(_WORD *)&self->_has & 2) != 0)
  {
LABEL_31:
    uint64_t v19 = [NSNumber numberWithUnsignedLongLong:self->_cumulatedSubmodelsRollbackForPostDeletionPolicyPerformanceInMilliSeconds];
    [v3 setObject:v19 forKey:@"cumulatedSubmodelsRollbackForPostDeletionPolicyPerformanceInMilliSeconds"];
  }
LABEL_32:
  return v3;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SGMIMetricsUpdateProcessInformation;
  id v4 = [(SGMIMetricsUpdateProcessInformation *)&v8 description];
  unint64_t v5 = [(SGMIMetricsUpdateProcessInformation *)self dictionaryRepresentation];
  unint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasCumulatedSubmodelsRollbackForPostDeletionPolicyPerformanceInMilliSeconds
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setHasCumulatedSubmodelsRollbackForPostDeletionPolicyPerformanceInMilliSeconds:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (void)setCumulatedSubmodelsRollbackForPostDeletionPolicyPerformanceInMilliSeconds:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_cumulatedSubmodelsRollbackForPostDeletionPolicyPerformanceInMilliSeconds = a3;
}

- (BOOL)hasSubmodelsPruningForCappingPolicyPerformanceInMilliSeconds
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setHasSubmodelsPruningForCappingPolicyPerformanceInMilliSeconds:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (void)setSubmodelsPruningForCappingPolicyPerformanceInMilliSeconds:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_submodelsPruningForCappingPolicyPerformanceInMilliSeconds = a3;
}

- (BOOL)hasSubmodelsUpdatePerformanceInMilliSeconds
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setHasSubmodelsUpdatePerformanceInMilliSeconds:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (void)setSubmodelsUpdatePerformanceInMilliSeconds:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_submodelsUpdatePerformanceInMilliSeconds = a3;
}

- (BOOL)hasBiomeAggregationPerformanceInMilliSeconds
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setHasBiomeAggregationPerformanceInMilliSeconds:(BOOL)a3
{
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (void)setBiomeAggregationPerformanceInMilliSeconds:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_biomeAggregationPerformanceInMilliSeconds = a3;
}

- (BOOL)hasSubmodelsStats
{
  return self->_submodelsStats != 0;
}

- (BOOL)hasRollbackedEmailsCountToComplyToPostDeletionPolicy
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (void)setHasRollbackedEmailsCountToComplyToPostDeletionPolicy:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2048;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (void)setRollbackedEmailsCountToComplyToPostDeletionPolicy:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_rollbackedEmailsCountToComplyToPostDeletionPolicy = a3;
}

- (BOOL)hasRollbackedSlicesCountToComplyToPostDeletionPolicy
{
  return (*(_WORD *)&self->_has >> 12) & 1;
}

- (void)setHasRollbackedSlicesCountToComplyToPostDeletionPolicy:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4096;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xEFFF | v3;
}

- (void)setRollbackedSlicesCountToComplyToPostDeletionPolicy:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x1000u;
  self->_rollbackedSlicesCountToComplyToPostDeletionPolicy = a3;
}

- (BOOL)hasDeletedEmailsCount
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setHasDeletedEmailsCount:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (void)setDeletedEmailsCount:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_deletedEmailsCount = a3;
}

- (BOOL)hasDeletedTokensCountToComplyToCappingPolicy
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setHasDeletedTokensCountToComplyToCappingPolicy:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (void)setDeletedTokensCountToComplyToCappingPolicy:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_deletedTokensCountToComplyToCappingPolicy = a3;
}

- (BOOL)hasMailsProcessedDuringIncrementalUpdate
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setHasMailsProcessedDuringIncrementalUpdate:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1024;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (void)setMailsProcessedDuringIncrementalUpdate:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_mailsProcessedDuringIncrementalUpdate = a3;
}

- (BOOL)hasDaysProcessedDuringIncrementalUpdate
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setHasDaysProcessedDuringIncrementalUpdate:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (void)setDaysProcessedDuringIncrementalUpdate:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_daysProcessedDuringIncrementalUpdate = a3;
}

- (BOOL)hasDaysAvailableDuringIncrementalUpdate
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setHasDaysAvailableDuringIncrementalUpdate:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (void)setDaysAvailableDuringIncrementalUpdate:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_daysAvailableDuringIncrementalUpdate = a3;
}

- (BOOL)hasIsSubmodelRebuilt
{
  return (*(_WORD *)&self->_has >> 13) & 1;
}

- (void)setHasIsSubmodelRebuilt:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 0x2000;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xDFFF | v3;
}

- (void)setIsSubmodelRebuilt:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x2000u;
  self->_isSubmodelRebuilt = a3;
}

- (BOOL)hasHoursSinceLastIncrementalUpdate
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setHasHoursSinceLastIncrementalUpdate:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (void)setHoursSinceLastIncrementalUpdate:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_hoursSinceLastIncrementalUpdate = a3;
}

- (int)StringAsCtsJobConstraints:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"CancelAfterDeadline"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"CpuIntensive"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"DiskIntensive"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"StartHandler"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"SuspendHandler"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"MemoryIntensive"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"SchedulingPriorityBackground"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"SchedulingPriorityDefault"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"SchedulingPriorityMaintenance"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"SchedulingPriorityUtility"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"SchedulingPriorityUserInitiated"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"SchedulingPriorityUserInitiatedOvercommit"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"RequestsApplicationLaunch"])
  {
    int v4 = 13;
  }
  else if ([v3 isEqualToString:@"RequiresInexpensiveNetworking"])
  {
    int v4 = 14;
  }
  else if ([v3 isEqualToString:@"RequiresNetwork"])
  {
    int v4 = 15;
  }
  else if ([v3 isEqualToString:@"RequiresPlugin"])
  {
    int v4 = 16;
  }
  else if ([v3 isEqualToString:@"TriggersRestart"])
  {
    int v4 = 17;
  }
  else
  {
    int v4 = 1;
  }

  return v4;
}

- (id)ctsJobConstraintsAsString:(int)a3
{
  if ((a3 - 1) >= 0x11)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E65B5790[a3 - 1];
  }
  return v3;
}

- (void)setCtsJobConstraints:(int *)a3 count:(unint64_t)a4
{
}

- (int)ctsJobConstraintsAtIndex:(unint64_t)a3
{
  p_ctsJobConstraints = &self->_ctsJobConstraints;
  unint64_t count = self->_ctsJobConstraints.count;
  if (count <= a3)
  {
    unint64_t v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C4A8];
    objc_super v8 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%lu) is out of range (%lu)", a3, count);
    uint64_t v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
  }
  return p_ctsJobConstraints->list[a3];
}

- (void)addCtsJobConstraints:(int)a3
{
}

- (void)clearCtsJobConstraints
{
}

- (int)ctsJobConstraints
{
  return self->_ctsJobConstraints.list;
}

- (unint64_t)ctsJobConstraintsCount
{
  return self->_ctsJobConstraints.count;
}

- (BOOL)hasHoursSinceReference
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setHasHoursSinceReference:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (void)setHoursSinceReference:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_hoursSinceReference = a3;
}

- (BOOL)hasBackgroundTrialMetadata
{
  return self->_backgroundTrialMetadata != 0;
}

- (BOOL)hasTrialMetadata
{
  return self->_trialMetadata != 0;
}

- (void)dealloc
{
  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)SGMIMetricsUpdateProcessInformation;
  [(SGMIMetricsUpdateProcessInformation *)&v3 dealloc];
}

@end