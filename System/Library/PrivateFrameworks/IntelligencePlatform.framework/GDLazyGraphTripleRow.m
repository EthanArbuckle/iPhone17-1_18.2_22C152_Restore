@interface GDLazyGraphTripleRow
- (NSString)object;
- (NSString)predicate;
- (NSString)relationshipId;
- (NSString)relationshipPredicate;
- (NSString)sourceDuplicates;
- (NSString)sources;
- (NSString)subject;
- (double)confidence;
- (double)timestamp;
@end

@implementation GDLazyGraphTripleRow

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cursor, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_sourceDuplicates, 0);
  objc_storeStrong((id *)&self->_confidence, 0);
  objc_storeStrong((id *)&self->_sources, 0);
  objc_storeStrong((id *)&self->_object, 0);
  objc_storeStrong((id *)&self->_relationshipPredicate, 0);
  objc_storeStrong((id *)&self->_relationshipId, 0);
  objc_storeStrong((id *)&self->_predicate, 0);
  objc_storeStrong((id *)&self->_subject, 0);

  objc_storeStrong((id *)&self->_subjectOverride, 0);
}

- (double)timestamp
{
  timestamp = self->_timestamp;
  if (!timestamp)
  {
    sub_1B2E66874((uint64_t)self->_cursor, (const char *)8, v2, v3, v4);
    v8 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v9 = self->_timestamp;
    self->_timestamp = v8;

    timestamp = self->_timestamp;
    if (!timestamp)
    {
      v11 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, v2, v3, v4);
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v11, v12, (uint64_t)a2, (uint64_t)self, @"GDSQLTripleRowIterator.m", 286, @"Invalid parameter not satisfying: %@", @"_timestamp != nil");

      timestamp = self->_timestamp;
    }
  }

  objc_msgSend_doubleValue(timestamp, a2, v2, v3, v4);
  return result;
}

- (NSString)sourceDuplicates
{
  sourceDuplicates = self->_sourceDuplicates;
  if (!sourceDuplicates)
  {
    sub_1B2E669A8((uint64_t)self->_cursor, (const char *)7, v2, v3, v4);
    v8 = (NSString *)objc_claimAutoreleasedReturnValue();
    v9 = self->_sourceDuplicates;
    self->_sourceDuplicates = v8;

    sourceDuplicates = self->_sourceDuplicates;
    if (!sourceDuplicates)
    {
      v15 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v10, v11, v12, v13);
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v15, v16, (uint64_t)a2, (uint64_t)self, @"GDSQLTripleRowIterator.m", 277, @"Invalid parameter not satisfying: %@", @"_sourceDuplicates");

      sourceDuplicates = self->_sourceDuplicates;
    }
  }

  return sourceDuplicates;
}

- (double)confidence
{
  confidence = self->_confidence;
  if (!confidence)
  {
    sub_1B2E66874((uint64_t)self->_cursor, (const char *)6, v2, v3, v4);
    v8 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v9 = self->_confidence;
    self->_confidence = v8;

    confidence = self->_confidence;
    if (!confidence)
    {
      uint64_t v11 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, v2, v3, v4);
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v11, v12, (uint64_t)a2, (uint64_t)self, @"GDSQLTripleRowIterator.m", 268, @"Invalid parameter not satisfying: %@", @"_confidence != nil");

      confidence = self->_confidence;
    }
  }

  objc_msgSend_doubleValue(confidence, a2, v2, v3, v4);
  return result;
}

- (NSString)sources
{
  sources = self->_sources;
  if (!sources)
  {
    sub_1B2E669A8((uint64_t)self->_cursor, (const char *)5, v2, v3, v4);
    v8 = (NSString *)objc_claimAutoreleasedReturnValue();
    v9 = self->_sources;
    self->_sources = v8;

    sources = self->_sources;
    if (!sources)
    {
      v15 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v10, v11, v12, v13);
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v15, v16, (uint64_t)a2, (uint64_t)self, @"GDSQLTripleRowIterator.m", 259, @"Invalid parameter not satisfying: %@", @"_sources");

      sources = self->_sources;
    }
  }

  return sources;
}

- (NSString)object
{
  object = self->_object;
  if (!object)
  {
    sub_1B2E669A8((uint64_t)self->_cursor, (const char *)4, v2, v3, v4);
    v8 = (NSString *)objc_claimAutoreleasedReturnValue();
    v9 = self->_object;
    self->_object = v8;

    object = self->_object;
    if (!object)
    {
      v15 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v10, v11, v12, v13);
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v15, v16, (uint64_t)a2, (uint64_t)self, @"GDSQLTripleRowIterator.m", 250, @"Invalid parameter not satisfying: %@", @"_object");

      object = self->_object;
    }
  }

  return object;
}

- (NSString)relationshipPredicate
{
  relationshipPredicate = self->_relationshipPredicate;
  if (!relationshipPredicate)
  {
    sub_1B2E669A8((uint64_t)self->_cursor, (const char *)3, v2, v3, v4);
    v8 = (NSString *)objc_claimAutoreleasedReturnValue();
    v9 = self->_relationshipPredicate;
    self->_relationshipPredicate = v8;

    relationshipPredicate = self->_relationshipPredicate;
    if (!relationshipPredicate)
    {
      v15 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v10, v11, v12, v13);
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v15, v16, (uint64_t)a2, (uint64_t)self, @"GDSQLTripleRowIterator.m", 241, @"Invalid parameter not satisfying: %@", @"_relationshipPredicate");

      relationshipPredicate = self->_relationshipPredicate;
    }
  }

  return relationshipPredicate;
}

- (NSString)relationshipId
{
  relationshipId = self->_relationshipId;
  if (!relationshipId)
  {
    sub_1B2E669A8((uint64_t)self->_cursor, (const char *)2, v2, v3, v4);
    v8 = (NSString *)objc_claimAutoreleasedReturnValue();
    v9 = self->_relationshipId;
    self->_relationshipId = v8;

    relationshipId = self->_relationshipId;
    if (!relationshipId)
    {
      v15 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v10, v11, v12, v13);
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v15, v16, (uint64_t)a2, (uint64_t)self, @"GDSQLTripleRowIterator.m", 232, @"Invalid parameter not satisfying: %@", @"_relationshipId");

      relationshipId = self->_relationshipId;
    }
  }

  return relationshipId;
}

- (NSString)predicate
{
  predicate = self->_predicate;
  if (!predicate)
  {
    sub_1B2E669A8((uint64_t)self->_cursor, (const char *)1, v2, v3, v4);
    v8 = (NSString *)objc_claimAutoreleasedReturnValue();
    v9 = self->_predicate;
    self->_predicate = v8;

    predicate = self->_predicate;
    if (!predicate)
    {
      v15 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v10, v11, v12, v13);
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v15, v16, (uint64_t)a2, (uint64_t)self, @"GDSQLTripleRowIterator.m", 223, @"Invalid parameter not satisfying: %@", @"_predicate");

      predicate = self->_predicate;
    }
  }

  return predicate;
}

- (NSString)subject
{
  subject = self->_subject;
  if (!subject)
  {
    subjectOverride = self->_subjectOverride;
    if (subjectOverride)
    {
      v9 = subjectOverride;
    }
    else
    {
      sub_1B2E669A8((uint64_t)self->_cursor, 0, v2, v3, v4);
      v9 = (NSString *)objc_claimAutoreleasedReturnValue();
    }
    v10 = self->_subject;
    self->_subject = v9;

    uint64_t v11 = [GDEntityIdentifier alloc];
    v15 = objc_msgSend_initWithString_(v11, v12, (uint64_t)self->_subject, v13, v14);
    objc_msgSend_stringValue(v15, v16, v17, v18, v19);
    v20 = (NSString *)objc_claimAutoreleasedReturnValue();
    v21 = self->_subject;
    self->_subject = v20;

    subject = self->_subject;
    if (!subject)
    {
      v27 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v22, v23, v24, v25);
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v27, v28, (uint64_t)a2, (uint64_t)self, @"GDSQLTripleRowIterator.m", 214, @"Invalid parameter not satisfying: %@", @"_subject");

      subject = self->_subject;
    }
  }

  return subject;
}

@end