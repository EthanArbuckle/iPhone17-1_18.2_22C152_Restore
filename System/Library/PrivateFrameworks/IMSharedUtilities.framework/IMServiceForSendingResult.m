@interface IMServiceForSendingResult
+ (BOOL)supportsSecureCoding;
- (BOOL)isFinal;
- (IMServiceForSendingResult)initWithCoder:(id)a3;
- (IMServiceReachabilityResult)bestResult;
- (NSDictionary)resultsByAccountID;
- (id)description;
- (id)initAsFinalResult:(BOOL)a3 bestResult:(id)a4 resultsByAccountID:(id)a5;
- (id)resultsForServiceName:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation IMServiceForSendingResult

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)initAsFinalResult:(BOOL)a3 bestResult:(id)a4 resultsByAccountID:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)IMServiceForSendingResult;
  v11 = [(IMServiceForSendingResult *)&v14 init];
  p_isa = (id *)&v11->super.isa;
  if (v11)
  {
    v11->_final = a3;
    objc_storeStrong((id *)&v11->_bestResult, a4);
    objc_storeStrong(p_isa + 3, a5);
  }

  return p_isa;
}

- (IMServiceForSendingResult)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)IMServiceForSendingResult;
  v5 = [(IMServiceForSendingResult *)&v13 init];
  if (v5)
  {
    v5->_final = [v4 decodeBoolForKey:@"final"];
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = [v4 decodeDictionaryWithKeysOfClass:v6 objectsOfClass:objc_opt_class() forKey:@"resultsByAccountID"];
    resultsByAccountID = v5->_resultsByAccountID;
    v5->_resultsByAccountID = (NSDictionary *)v7;

    id v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bestResult"];
    if (v9)
    {
      uint64_t v10 = [(NSDictionary *)v5->_resultsByAccountID objectForKeyedSubscript:v9];
      bestResult = v5->_bestResult;
      v5->_bestResult = (IMServiceReachabilityResult *)v10;
    }
  }

  return v5;
}

- (id)resultsForServiceName:(id)a3
{
  id v4 = a3;
  v5 = [(IMServiceForSendingResult *)self resultsByAccountID];
  uint64_t v6 = [v5 allValues];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_1A07C2BC0;
  v10[3] = &unk_1E5A10BB0;
  id v11 = v4;
  id v7 = v4;
  v8 = objc_msgSend(v6, "__imArrayByFilteringWithBlock:", v10);

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  [v6 encodeBool:self->_final forKey:@"final"];
  [v6 encodeObject:self->_resultsByAccountID forKey:@"resultsByAccountID"];
  if (self->_bestResult)
  {
    id v4 = -[NSDictionary allKeysForObject:](self->_resultsByAccountID, "allKeysForObject:");
    v5 = [v4 firstObject];

    if (v5) {
      [v6 encodeObject:v5 forKey:@"bestResult"];
    }
  }
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  if ([(IMServiceForSendingResult *)self isFinal]) {
    v5 = @"YES";
  }
  else {
    v5 = @"NO";
  }
  id v6 = [(IMServiceForSendingResult *)self bestResult];
  id v7 = [(IMServiceForSendingResult *)self resultsByAccountID];
  v8 = [v3 stringWithFormat:@"<%@ %p [isFinal: %@ bestResult: %@ resultsByAccountID: %@]>", v4, self, v5, v6, v7];

  return v8;
}

- (BOOL)isFinal
{
  return self->_final;
}

- (IMServiceReachabilityResult)bestResult
{
  return self->_bestResult;
}

- (NSDictionary)resultsByAccountID
{
  return self->_resultsByAccountID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultsByAccountID, 0);

  objc_storeStrong((id *)&self->_bestResult, 0);
}

@end