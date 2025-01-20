@interface SGCustomResponsesParameters
- (BOOL)allowProfanity;
- (BOOL)isCustomResponsesEnabled;
- (BOOL)useNonNegativeClassesOnly;
- (SGCustomResponsesParameters)initWithDictionary:(id)a3;
- (double)countExponent;
- (double)distanceThreshold;
- (double)maxReplyGapSecs;
- (double)minDecayedCountForPrediction;
- (double)minDecayedCountForPruning;
- (double)minimumTimeIntervalSecs;
- (double)timeDecayFactor;
- (double)usageSpreadExponent;
- (unint64_t)compatibilityVersion;
- (unint64_t)filterBatchSize;
- (unint64_t)knowledgeStoreQueryLimit;
- (unint64_t)maxReplyLength;
- (unint64_t)maxRowsInPerRecipientTable;
- (unint64_t)maxStoredCustomResponses;
- (unint64_t)maxStoredMessages;
- (unint64_t)minimumDistinctRecipients;
- (unint64_t)minimumReplyOccurences;
@end

@implementation SGCustomResponsesParameters

- (BOOL)useNonNegativeClassesOnly
{
  return self->_useNonNegativeClassesOnly;
}

- (unint64_t)compatibilityVersion
{
  return self->_compatibilityVersion;
}

- (BOOL)allowProfanity
{
  return self->_allowProfanity;
}

- (double)usageSpreadExponent
{
  return self->_usageSpreadExponent;
}

- (double)maxReplyGapSecs
{
  return self->_maxReplyGapSecs;
}

- (unint64_t)maxReplyLength
{
  return self->_maxReplyLength;
}

- (unint64_t)knowledgeStoreQueryLimit
{
  return self->_knowledgeStoreQueryLimit;
}

- (unint64_t)maxRowsInPerRecipientTable
{
  return self->_maxRowsInPerRecipientTable;
}

- (unint64_t)maxStoredCustomResponses
{
  return self->_maxStoredCustomResponses;
}

- (unint64_t)maxStoredMessages
{
  return self->_maxStoredMessages;
}

- (double)minDecayedCountForPrediction
{
  return self->_minDecayedCountForPrediction;
}

- (double)minDecayedCountForPruning
{
  return self->_minDecayedCountForPruning;
}

- (double)distanceThreshold
{
  return self->_distanceThreshold;
}

- (double)countExponent
{
  return self->_countExponent;
}

- (double)timeDecayFactor
{
  return self->_timeDecayFactor;
}

- (unint64_t)minimumReplyOccurences
{
  return self->_minimumReplyOccurences;
}

- (unint64_t)minimumDistinctRecipients
{
  return self->_minimumDistinctRecipients;
}

- (double)minimumTimeIntervalSecs
{
  return self->_minimumTimeIntervalSecs;
}

- (unint64_t)filterBatchSize
{
  return self->_filterBatchSize;
}

- (BOOL)isCustomResponsesEnabled
{
  return self->_isCustomResponsesEnabled;
}

- (SGCustomResponsesParameters)initWithDictionary:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (!v4)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      v53 = &_os_log_internal;
      v54 = "dictionary";
      goto LABEL_73;
    }
LABEL_74:
    v56 = 0;
    goto LABEL_75;
  }

  v58.receiver = self;
  v58.super_class = (Class)SGCustomResponsesParameters;
  self = [(SGCustomResponsesParameters *)&v58 init];
  if (self)
  {
    v6 = [v5 numberAssertedForKey:@"IS_CUSTOM_RESPONSES_ENABLED"];
    if (!v6)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        v53 = &_os_log_internal;
        v54 = "[dictionary numberAssertedForKey:IS_CUSTOM_RESPONSES_ENABLED]";
        goto LABEL_73;
      }
      goto LABEL_74;
    }
    v7 = v6;
    self->_isCustomResponsesEnabled = [v6 BOOLValue];

    v8 = [v5 numberAssertedForKey:@"FILTER_BATCH_SIZE"];
    if (!v8)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        v53 = &_os_log_internal;
        v54 = "[dictionary numberAssertedForKey:FILTER_BATCH_SIZE]";
        goto LABEL_73;
      }
      goto LABEL_74;
    }
    v9 = v8;
    self->_filterBatchSize = [v8 unsignedIntegerValue];

    v10 = [v5 numberAssertedForKey:@"MINIMUM_TIME_INTERVAL_SECS"];
    if (!v10)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        v53 = &_os_log_internal;
        v54 = "[dictionary numberAssertedForKey:MINIMUM_TIME_INTERVAL_SECS]";
        goto LABEL_73;
      }
      goto LABEL_74;
    }
    v11 = v10;
    [v10 doubleValue];
    self->_minimumTimeIntervalSecs = v12;

    v13 = [v5 numberAssertedForKey:@"MINIMUM_DISTINCT_RECIPIENTS"];
    if (!v13)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        v53 = &_os_log_internal;
        v54 = "[dictionary numberAssertedForKey:MINIMUM_DISTINCT_RECIPIENTS]";
        goto LABEL_73;
      }
      goto LABEL_74;
    }
    v14 = v13;
    self->_minimumDistinctRecipients = [v13 unsignedIntegerValue];

    v15 = [v5 numberAssertedForKey:@"MINIMUM_REPLY_OCCURENCES"];
    if (!v15)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        v53 = &_os_log_internal;
        v54 = "[dictionary numberAssertedForKey:MINIMUM_REPLY_OCCURENCES]";
        goto LABEL_73;
      }
      goto LABEL_74;
    }
    v16 = v15;
    self->_minimumReplyOccurences = [v15 unsignedIntegerValue];

    v17 = [v5 numberAssertedForKey:@"TIME_DECAY_FACTOR"];
    if (!v17)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        v53 = &_os_log_internal;
        v54 = "[dictionary numberAssertedForKey:TIME_DECAY_FACTOR]";
        goto LABEL_73;
      }
      goto LABEL_74;
    }
    v18 = v17;
    [v17 doubleValue];
    self->_double timeDecayFactor = v19;

    v20 = [v5 numberAssertedForKey:@"COUNT_EXPONENT"];
    if (!v20)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        v53 = &_os_log_internal;
        v54 = "[dictionary numberAssertedForKey:COUNT_EXPONENT]";
        goto LABEL_73;
      }
      goto LABEL_74;
    }
    v21 = v20;
    [v20 doubleValue];
    self->_countExponent = v22;

    v23 = [v5 numberAssertedForKey:@"DISTANCE_THRESHOLD"];
    if (!v23)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        v53 = &_os_log_internal;
        v54 = "[dictionary numberAssertedForKey:DISTANCE_THRESHOLD]";
        goto LABEL_73;
      }
      goto LABEL_74;
    }
    v24 = v23;
    [v23 doubleValue];
    self->_distanceThreshold = v25;

    v26 = [v5 numberAssertedForKey:@"MIN_DECAYED_COUNT_FOR_PREDICTION"];
    if (!v26)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        v53 = &_os_log_internal;
        v54 = "[dictionary numberAssertedForKey:MIN_DECAYED_COUNT_FOR_PREDICTION]";
        goto LABEL_73;
      }
      goto LABEL_74;
    }
    v27 = v26;
    [v26 doubleValue];
    self->_minDecayedCountForPrediction = v28;

    v29 = [v5 numberAssertedForKey:@"MIN_DECAYED_COUNT_FOR_PRUNING"];
    if (!v29)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        v53 = &_os_log_internal;
        v54 = "[dictionary numberAssertedForKey:MIN_DECAYED_COUNT_FOR_PRUNING]";
        goto LABEL_73;
      }
      goto LABEL_74;
    }
    v30 = v29;
    [v29 doubleValue];
    self->_minDecayedCountForPruning = v31;

    v32 = [v5 numberAssertedForKey:@"MAX_STORED_MESSAGES"];
    if (!v32)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        v53 = &_os_log_internal;
        v54 = "[dictionary numberAssertedForKey:MAX_STORED_MESSAGES]";
        goto LABEL_73;
      }
      goto LABEL_74;
    }
    v33 = v32;
    self->_maxStoredMessages = [v32 unsignedIntegerValue];

    v34 = [v5 numberAssertedForKey:@"MAX_STORED_CUSTOM_RESPONSES"];
    if (!v34)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        v53 = &_os_log_internal;
        v54 = "[dictionary numberAssertedForKey:MAX_STORED_CUSTOM_RESPONSES]";
        goto LABEL_73;
      }
      goto LABEL_74;
    }
    v35 = v34;
    self->_maxStoredCustomResponses = [v34 unsignedIntegerValue];

    v36 = [v5 numberAssertedForKey:@"MAX_ROWS_IN_PER_RECIPIENT_TABLE"];
    if (!v36)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        v53 = &_os_log_internal;
        v54 = "[dictionary numberAssertedForKey:MAX_ROWS_IN_PER_RECIPIENT_TABLE]";
        goto LABEL_73;
      }
      goto LABEL_74;
    }
    v37 = v36;
    self->_maxRowsInPerRecipientTable = [v36 unsignedIntegerValue];

    v38 = [v5 numberAssertedForKey:@"CUSTOM_RESPONSES_COMPATIBILITY_VERSION"];
    if (!v38)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        v53 = &_os_log_internal;
        v54 = "[dictionary numberAssertedForKey:CUSTOM_RESPONSES_COMPATIBILITY_VERSION]";
        goto LABEL_73;
      }
      goto LABEL_74;
    }
    v39 = v38;
    self->_compatibilityVersion = [v38 unsignedIntegerValue];

    v40 = [v5 numberAssertedForKey:@"ALLOW_PROFANITY"];
    if (!v40)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        v53 = &_os_log_internal;
        v54 = "[dictionary numberAssertedForKey:ALLOW_PROFANITY]";
        goto LABEL_73;
      }
      goto LABEL_74;
    }
    v41 = v40;
    self->_allowProfanity = [v40 BOOLValue];

    v42 = [v5 numberAssertedForKey:@"KNOWLEDGE_STORE_QUERY_LIMIT"];
    if (!v42)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        v53 = &_os_log_internal;
        v54 = "[dictionary numberAssertedForKey:KNOWLEDGE_STORE_QUERY_LIMIT]";
        goto LABEL_73;
      }
      goto LABEL_74;
    }
    v43 = v42;
    self->_knowledgeStoreQueryLimit = [v42 unsignedIntegerValue];

    v44 = [v5 numberAssertedForKey:@"MAX_REPLY_LENGTH"];
    if (!v44)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        v53 = &_os_log_internal;
        v54 = "[dictionary numberAssertedForKey:MAX_REPLY_LENGTH]";
        goto LABEL_73;
      }
      goto LABEL_74;
    }
    v45 = v44;
    self->_maxReplyLength = [v44 unsignedIntegerValue];

    v46 = [v5 numberAssertedForKey:@"MAX_REPLY_GAP_SECS"];
    if (!v46)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        v53 = &_os_log_internal;
        v54 = "[dictionary numberAssertedForKey:MAX_REPLY_GAP_SECS]";
        goto LABEL_73;
      }
      goto LABEL_74;
    }
    v47 = v46;
    [v46 doubleValue];
    self->_maxReplyGapSecs = v48;

    v49 = [v5 numberAssertedForKey:@"USAGE_SPREAD_EXPONENT"];
    if (!v49)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        v53 = &_os_log_internal;
        v54 = "[dictionary numberAssertedForKey:USAGE_SPREAD_EXPONENT]";
        goto LABEL_73;
      }
      goto LABEL_74;
    }
    v50 = v49;
    [v49 doubleValue];
    self->_usageSpreadExponent = v51;

    v52 = [v5 objectForKeyedSubscript:@"USE_NON_NEGATIVE_CLASSES_ONLY"];
    self->_useNonNegativeClassesOnly = [v52 BOOLValue];

    if (self->_minimumTimeIntervalSecs < 0.0)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        v53 = &_os_log_internal;
        v54 = "0 <= _minimumTimeIntervalSecs";
LABEL_73:
        _os_log_fault_impl(&dword_226E32000, v53, OS_LOG_TYPE_FAULT, v54, buf, 2u);
        goto LABEL_74;
      }
      goto LABEL_74;
    }
    double timeDecayFactor = self->_timeDecayFactor;
    if (timeDecayFactor < 0.0 || timeDecayFactor > 1.0)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        v53 = &_os_log_internal;
        v54 = "0 <= _timeDecayFactor && _timeDecayFactor <= 1";
        goto LABEL_73;
      }
      goto LABEL_74;
    }
    if (self->_countExponent < 0.0)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        v53 = &_os_log_internal;
        v54 = "0 <= _countExponent";
        goto LABEL_73;
      }
      goto LABEL_74;
    }
  }
  self = self;
  v56 = self;
LABEL_75:

  return v56;
}

@end