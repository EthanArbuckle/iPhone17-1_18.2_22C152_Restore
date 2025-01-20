@interface SGSelfIDSupervision
- (BOOL)isNegativeExample;
- (BOOL)isPositiveExample;
- (SGSelfIDSupervision)initWithMessage:(id)a3 candidateName:(_NSRange)a4;
- (_NSRange)candidateNameRange;
- (void)setCandidateNameRange:(_NSRange)a3;
- (void)setIsNegativeExample:(BOOL)a3;
- (void)setIsPositiveExample:(BOOL)a3;
@end

@implementation SGSelfIDSupervision

- (void)setCandidateNameRange:(_NSRange)a3
{
  self->_candidateNameRange = a3;
}

- (_NSRange)candidateNameRange
{
  NSUInteger length = self->_candidateNameRange.length;
  NSUInteger location = self->_candidateNameRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setIsNegativeExample:(BOOL)a3
{
  self->_isNegativeExample = a3;
}

- (BOOL)isNegativeExample
{
  return self->_isNegativeExample;
}

- (void)setIsPositiveExample:(BOOL)a3
{
  self->_isPositiveExample = a3;
}

- (BOOL)isPositiveExample
{
  return self->_isPositiveExample;
}

- (SGSelfIDSupervision)initWithMessage:(id)a3 candidateName:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v19.receiver = self;
  v19.super_class = (Class)SGSelfIDSupervision;
  v8 = [(SGSelfIDSupervision *)&v19 init];
  if (v8)
  {
    v9 = (void *)MEMORY[0x1CB79B230]();
    -[SGSelfIDSupervision setCandidateNameRange:](v8, "setCandidateNameRange:", location, length);
    [(SGSelfIDSupervision *)v8 setIsPositiveExample:0];
    [(SGSelfIDSupervision *)v8 setIsNegativeExample:0];
    if (hasMessageAndValidAuthorsName(v7))
    {
      v10 = objc_opt_new();
      [v10 addObject:*MEMORY[0x1E4F1ADF0]];
      [v10 addObject:*MEMORY[0x1E4F1ADE0]];
      v11 = [v7 author];
      v12 = +[SGContactPipelineHelper findContactsForPerson:v11 fetchingKeys:v10];

      if (v12 && [v12 count])
      {
        v13 = (void *)MEMORY[0x1CB79B230]();
        v14 = [v7 textContent];
        if (![v14 length]
          || location == 0x7FFFFFFFFFFFFFFFLL
          || location + length > [v14 length])
        {
          v15 = sgLogHandle();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138412802;
            v21 = v14;
            __int16 v22 = 2048;
            NSUInteger v23 = location;
            __int16 v24 = 2048;
            NSUInteger v25 = length;
            _os_log_fault_impl(&dword_1CA650000, v15, OS_LOG_TYPE_FAULT, "CandidateNameRange not in plainTextContent: %@ %tu %tu", buf, 0x20u);
          }

          if (_PASEvaluateLogFaultAndProbCrashCriteria()) {
            abort();
          }
        }
        else
        {
          v17 = objc_msgSend(v14, "substringWithRange:", location, length);
          BOOL v18 = +[SGContactPipelineHelper personExistsInContacts:v12 name:v17 handle:0];

          if (v18) {
            [(SGSelfIDSupervision *)v8 setIsPositiveExample:1];
          }
          else {
            [(SGSelfIDSupervision *)v8 setIsNegativeExample:1];
          }
        }
      }
    }
  }

  return v8;
}

@end