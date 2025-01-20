@interface IETestResult
- (BOOL)isEqual:(id)a3;
- (NSString)flowId;
- (NSString)summary;
- (NSString)testName;
- (unint64_t)hash;
- (unint64_t)status;
- (void)setFlowId:(id)a3;
- (void)setStatus:(unint64_t)a3;
- (void)setSummary:(id)a3;
- (void)setTestName:(id)a3;
@end

@implementation IETestResult

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      unint64_t v6 = [(IETestResult *)self status];
      if (v6 != [v5 status])
      {
        char v8 = 0;
LABEL_20:

        goto LABEL_21;
      }
      v20 = [(IETestResult *)self flowId];
      v7 = [v5 flowId];
      if (v20 != v7)
      {
        v19 = [(IETestResult *)self flowId];
        v17 = [v5 flowId];
        if (!objc_msgSend(v19, "isEqualToString:"))
        {
          char v8 = 0;
          goto LABEL_18;
        }
      }
      v9 = [(IETestResult *)self testName];
      v10 = [v5 testName];
      if (v9 == v10
        || ([(IETestResult *)self testName],
            v18 = objc_claimAutoreleasedReturnValue(),
            [v5 testName],
            v16 = objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v18, "isEqualToString:")))
      {
        v11 = [(IETestResult *)self summary];
        v12 = [v5 summary];
        if (v11 == v12)
        {

          char v8 = 1;
        }
        else
        {
          v13 = [(IETestResult *)self summary];
          v14 = [v5 summary];
          char v8 = [v13 isEqualToString:v14];
        }
        if (v9 == v10)
        {
LABEL_17:

          if (v20 == v7)
          {
LABEL_19:

            goto LABEL_20;
          }
LABEL_18:

          goto LABEL_19;
        }
      }
      else
      {
        char v8 = 0;
      }

      goto LABEL_17;
    }
  }
  char v8 = 0;
LABEL_21:

  return v8;
}

- (unint64_t)hash
{
  int v3 = [(IETestResult *)self status];
  id v4 = [(IETestResult *)self flowId];
  uint64_t v5 = [v4 hash];

  unint64_t v6 = [(IETestResult *)self testName];
  uint64_t v7 = [v6 hash];

  char v8 = [(IETestResult *)self summary];
  uint64_t v9 = [v8 hash];
  uint64_t v10 = v5 - v3 + 32 * v3;
  unint64_t v11 = v9 - (v7 - v10 + 32 * v10) + 32 * (v7 - v10 + 32 * v10) + 923521;

  return v11;
}

- (unint64_t)status
{
  return self->_status;
}

- (void)setStatus:(unint64_t)a3
{
  self->_status = a3;
}

- (NSString)flowId
{
  return self->_flowId;
}

- (void)setFlowId:(id)a3
{
}

- (NSString)testName
{
  return self->_testName;
}

- (void)setTestName:(id)a3
{
}

- (NSString)summary
{
  return self->_summary;
}

- (void)setSummary:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_summary, 0);
  objc_storeStrong((id *)&self->_testName, 0);

  objc_storeStrong((id *)&self->_flowId, 0);
}

@end