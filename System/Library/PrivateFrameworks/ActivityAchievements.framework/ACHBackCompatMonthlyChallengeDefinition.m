@interface ACHBackCompatMonthlyChallengeDefinition
+ (BOOL)supportsSecureCoding;
+ (id)definitionFromData:(id)a3;
- (ACHBackCompatMonthlyChallengeDefinition)initWithCoder:(id)a3;
- (NSExpression)goalExpression;
- (NSString)identifier;
- (NSString)typeString;
- (id)_dateComponentsFromIdentifier;
- (id)_goalExpressionValue;
- (id)template;
- (unint64_t)_monthlyChallengeTypeFromTypeString;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ACHBackCompatMonthlyChallengeDefinition

+ (id)definitionFromData:(id)a3
{
  v3 = (objc_class *)MEMORY[0x263F08928];
  id v4 = a3;
  id v11 = 0;
  v5 = (void *)[[v3 alloc] initForReadingFromData:v4 error:&v11];

  id v6 = v11;
  [v5 setClass:objc_opt_class() forClassName:@"_HKAchievementDefinition"];
  v7 = [v5 decodeObjectOfClass:objc_opt_class() forKey:*MEMORY[0x263F081D0]];
  [v5 finishDecoding];
  if (v6)
  {
    v8 = ACHLogDefault();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      +[ACHBackCompatMonthlyChallengeDefinition definitionFromData:]((uint64_t)v6, v8);
    }

    id v9 = 0;
  }
  else
  {
    id v9 = v7;
  }

  return v9;
}

- (id)template
{
  unint64_t v3 = [(ACHBackCompatMonthlyChallengeDefinition *)self _monthlyChallengeTypeFromTypeString];
  id v4 = 0;
  if (v3)
  {
    unint64_t v5 = v3;
    if (v3 != 29)
    {
      id v6 = [(ACHBackCompatMonthlyChallengeDefinition *)self _dateComponentsFromIdentifier];
      if (v6)
      {
        v7 = objc_msgSend(MEMORY[0x263EFF8F0], "hk_gregorianCalendar");
        uint64_t v8 = [v7 dateFromComponents:v6];
        id v9 = objc_msgSend(v7, "hk_startOfMonthForDate:addingMonths:", v8, 1);
        v10 = objc_msgSend(v7, "hk_startOfDateBySubtractingDays:fromDate:", 1, v9);
        id v11 = [v7 components:28 fromDate:v10];
        v12 = [[ACHDateComponentInterval alloc] initWithStartDateComponents:v6 endDateComponents:v11];
        uint64_t v13 = [(ACHBackCompatMonthlyChallengeDefinition *)self _goalExpressionValue];
        v23 = (void *)v8;
        if (v13)
        {
          v14 = (void *)v13;
          v15 = [(ACHBackCompatMonthlyChallengeDefinition *)self typeString];
          int v16 = [v15 containsString:@"Average"];

          if (v16)
          {
            unint64_t v17 = [(ACHDateComponentInterval *)v12 countOfDaysContainedInIntervalInCalendar:v7];
            v18 = NSNumber;
            [v14 doubleValue];
            uint64_t v20 = [v18 numberWithDouble:v19 * (double)v17];

            v14 = (void *)v20;
          }
          [v14 doubleValue];
          id v4 = ACHMonthlyChallengeTemplate(v5, v12, v21);
          [v4 setSourceName:@"MonthlyChallenges"];
        }
        else
        {
          id v4 = 0;
        }
      }
      else
      {
        id v4 = 0;
      }
    }
  }

  return v4;
}

- (unint64_t)_monthlyChallengeTypeFromTypeString
{
  v2 = [(ACHBackCompatMonthlyChallengeDefinition *)self typeString];
  unint64_t v3 = ACHMonthlyChallengeTypeFromLegacyString(v2);

  return v3;
}

- (id)_dateComponentsFromIdentifier
{
  v2 = [(ACHBackCompatMonthlyChallengeDefinition *)self identifier];
  unint64_t v3 = [v2 componentsSeparatedByString:@"_"];

  if ([v3 count] == 3)
  {
    id v4 = [v3 objectAtIndexedSubscript:1];
    unint64_t v5 = [v3 objectAtIndexedSubscript:2];
    id v6 = ACHDateComponentsForYearMonthDay([v4 integerValue], objc_msgSend(v5, "integerValue"), 1);
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)_goalExpressionValue
{
  v2 = [(ACHBackCompatMonthlyChallengeDefinition *)self goalExpression];
  unint64_t v3 = [v2 expressionValueWithObject:0 context:0];

  objc_opt_class();
  id v4 = 0;
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ACHBackCompatMonthlyChallengeDefinition)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ACHBackCompatMonthlyChallengeDefinition;
  unint64_t v5 = [(ACHBackCompatMonthlyChallengeDefinition *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"achievementTypeString"];
    typeString = v5->_typeString;
    v5->_typeString = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"expressionForGoalValue"];
    goalExpression = v5->_goalExpression;
    v5->_goalExpression = (NSExpression *)v10;

    [(NSExpression *)v5->_goalExpression allowEvaluation];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v3 = [MEMORY[0x263EFF940] exceptionWithName:@"ACHBackCompatMonthlyChallengeDefinition Un-Implemented Exception" reason:@"Encoding new system templates to backwards compatible monthly challenge definitions is unsupported." userInfo:0];
  [v3 raise];
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)typeString
{
  return self->_typeString;
}

- (NSExpression)goalExpression
{
  return self->_goalExpression;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_goalExpression, 0);
  objc_storeStrong((id *)&self->_typeString, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (void)definitionFromData:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21F582000, a2, OS_LOG_TYPE_ERROR, "Failed to decode ACHBackCompatMonthlyChallengeDefinition with error %{public}@", (uint8_t *)&v2, 0xCu);
}

@end