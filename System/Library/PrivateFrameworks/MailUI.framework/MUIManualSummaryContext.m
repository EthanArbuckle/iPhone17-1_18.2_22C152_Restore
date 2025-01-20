@interface MUIManualSummaryContext
- (BOOL)isEqual:(id)a3;
- (BOOL)isInlineSummary;
- (EFFuture)summaryControllerFuture;
- (MUIManualSummaryContext)initWithSummary:(id)a3 error:(id)a4 summarizableMessageCount:(unint64_t)a5 isInlineSummary:(BOOL)a6 summaryControllerFuture:(id)a7;
- (NSAttributedString)summary;
- (NSError)error;
- (int64_t)state;
- (unint64_t)hash;
- (unint64_t)summarizableMessageCount;
- (void)setError:(id)a3;
- (void)setIsInlineSummary:(BOOL)a3;
- (void)setState:(int64_t)a3;
- (void)setSummarizableMessageCount:(unint64_t)a3;
- (void)setSummary:(id)a3;
- (void)setSummaryControllerFuture:(id)a3;
@end

@implementation MUIManualSummaryContext

- (MUIManualSummaryContext)initWithSummary:(id)a3 error:(id)a4 summarizableMessageCount:(unint64_t)a5 isInlineSummary:(BOOL)a6 summaryControllerFuture:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  v20.receiver = self;
  v20.super_class = (Class)MUIManualSummaryContext;
  v15 = [(MUIManualSummaryContext *)&v20 init];
  v16 = v15;
  if (v15)
  {
    v15->_state = 0;
    uint64_t v17 = [v12 copy];
    summary = v16->_summary;
    v16->_summary = (NSAttributedString *)v17;

    objc_storeStrong((id *)&v16->_error, a4);
    v16->_summarizableMessageCount = a5;
    v16->_isInlineSummary = a6;
    objc_storeStrong((id *)&v16->_summaryControllerFuture, a7);
  }

  return v16;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (MUIManualSummaryContext *)a3;
  if (v4 == self)
  {
    LOBYTE(v12) = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v6 = [(MUIManualSummaryContext *)self summary];
      v7 = [(MUIManualSummaryContext *)v5 summary];
      if (EFObjectsAreEqual())
      {
        v8 = [(MUIManualSummaryContext *)self error];
        v9 = [(MUIManualSummaryContext *)v5 error];
        if (EFObjectsAreEqual()
          && (unint64_t v10 = [(MUIManualSummaryContext *)self summarizableMessageCount],
              v10 == [(MUIManualSummaryContext *)v5 summarizableMessageCount]))
        {
          BOOL v11 = [(MUIManualSummaryContext *)self isInlineSummary];
          BOOL v12 = v11 ^ [(MUIManualSummaryContext *)v5 isInlineSummary] ^ 1;
        }
        else
        {
          LOBYTE(v12) = 0;
        }
      }
      else
      {
        LOBYTE(v12) = 0;
      }
    }
    else
    {
      LOBYTE(v12) = 0;
    }
  }

  return v12;
}

- (unint64_t)hash
{
  v3 = [(MUIManualSummaryContext *)self summary];
  uint64_t v4 = [v3 hash];

  v5 = [(MUIManualSummaryContext *)self error];
  uint64_t v6 = 33 * (33 * v4 + [v5 hash]);

  unint64_t v7 = 33 * (v6 + [(MUIManualSummaryContext *)self summarizableMessageCount]);
  v8 = objc_msgSend(NSNumber, "numberWithBool:", -[MUIManualSummaryContext isInlineSummary](self, "isInlineSummary"));
  unint64_t v9 = v7 + [v8 hash] + 1185921;

  return v9;
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (NSAttributedString)summary
{
  return self->_summary;
}

- (void)setSummary:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (unint64_t)summarizableMessageCount
{
  return self->_summarizableMessageCount;
}

- (void)setSummarizableMessageCount:(unint64_t)a3
{
  self->_summarizableMessageCount = a3;
}

- (BOOL)isInlineSummary
{
  return self->_isInlineSummary;
}

- (void)setIsInlineSummary:(BOOL)a3
{
  self->_isInlineSummary = a3;
}

- (EFFuture)summaryControllerFuture
{
  return self->_summaryControllerFuture;
}

- (void)setSummaryControllerFuture:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_summaryControllerFuture, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_summary, 0);
}

@end