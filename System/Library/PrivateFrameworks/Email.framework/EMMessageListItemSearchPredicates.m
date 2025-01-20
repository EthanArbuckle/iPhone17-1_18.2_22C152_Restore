@interface EMMessageListItemSearchPredicates
+ (id)spotlightBodySearchPredicateForValue:(id)a3;
+ (id)spotlightQueryPredicateForString:(id)a3;
+ (id)spotlightRecipientSearchPredicateForValue:(id)a3 operator:(unint64_t)a4;
+ (id)spotlightSearchPredicateForValue:(id)a3;
+ (id)spotlightSenderSearchPredicateForValue:(id)a3 operator:(unint64_t)a4;
+ (id)spotlightSubjectSearchPredicateForValue:(id)a3 operator:(unint64_t)a4;
+ (id)spotlightUserQueryStringPredicateForValue:(id)a3;
@end

@implementation EMMessageListItemSearchPredicates

+ (id)spotlightSearchPredicateForValue:(id)a3
{
  v14[5] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (void *)MEMORY[0x1E4F28BA0];
  v6 = [a1 spotlightRecipientSearchPredicateForValue:v4 operator:99];
  v7 = objc_msgSend(a1, "spotlightSenderSearchPredicateForValue:operator:", v4, 99, v6);
  v14[1] = v7;
  v8 = [a1 spotlightSubjectSearchPredicateForValue:v4 operator:99];
  v14[2] = v8;
  v9 = [a1 spotlightBodySearchPredicateForValue:v4];
  v14[3] = v9;
  v10 = [a1 spotlightUserQueryStringPredicateForValue:v4];
  v14[4] = v10;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:5];
  v12 = [v5 orPredicateWithSubpredicates:v11];

  return v12;
}

+ (id)spotlightRecipientSearchPredicateForValue:(id)a3 operator:(unint64_t)a4
{
  v35[6] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = (void *)MEMORY[0x1E4F28B98];
  v34 = v5;
  v7 = [MEMORY[0x1E4F28C68] expressionForKeyPath:@"toList.emailAddressValue.simpleAddress"];
  v8 = [MEMORY[0x1E4F28C68] expressionForConstantValue:v5];
  v9 = [v6 predicateWithLeftExpression:v7 rightExpression:v8 modifier:2 type:a4 options:1];

  v10 = (void *)MEMORY[0x1E4F28B98];
  v11 = [MEMORY[0x1E4F28C68] expressionForKeyPath:@"toList.emailAddressValue.displayName"];
  v12 = [MEMORY[0x1E4F28C68] expressionForConstantValue:v34];
  v13 = [v10 predicateWithLeftExpression:v11 rightExpression:v12 modifier:2 type:a4 options:1];

  v14 = (void *)MEMORY[0x1E4F28B98];
  v15 = [MEMORY[0x1E4F28C68] expressionForKeyPath:@"ccList.emailAddressValue.simpleAddress"];
  v16 = [MEMORY[0x1E4F28C68] expressionForConstantValue:v34];
  v17 = [v14 predicateWithLeftExpression:v15 rightExpression:v16 modifier:2 type:a4 options:1];

  v18 = (void *)MEMORY[0x1E4F28B98];
  v19 = [MEMORY[0x1E4F28C68] expressionForKeyPath:@"ccList.emailAddressValue.displayName"];
  v20 = [MEMORY[0x1E4F28C68] expressionForConstantValue:v34];
  v21 = [v18 predicateWithLeftExpression:v19 rightExpression:v20 modifier:2 type:a4 options:1];

  v22 = (void *)MEMORY[0x1E4F28B98];
  v23 = [MEMORY[0x1E4F28C68] expressionForKeyPath:@"bccList.emailAddressValue.simpleAddress"];
  v24 = [MEMORY[0x1E4F28C68] expressionForConstantValue:v34];
  v25 = [v22 predicateWithLeftExpression:v23 rightExpression:v24 modifier:2 type:a4 options:1];

  v26 = (void *)MEMORY[0x1E4F28B98];
  v27 = [MEMORY[0x1E4F28C68] expressionForKeyPath:@"bccList.emailAddressValue.displayName"];
  v28 = [MEMORY[0x1E4F28C68] expressionForConstantValue:v34];
  v29 = [v26 predicateWithLeftExpression:v27 rightExpression:v28 modifier:2 type:a4 options:1];

  v30 = (void *)MEMORY[0x1E4F28BA0];
  v35[0] = v9;
  v35[1] = v13;
  v35[2] = v17;
  v35[3] = v21;
  v35[4] = v25;
  v35[5] = v29;
  v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:6];
  v32 = [v30 orPredicateWithSubpredicates:v31];

  return v32;
}

+ (id)spotlightSenderSearchPredicateForValue:(id)a3 operator:(unint64_t)a4
{
  v18[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = (void *)MEMORY[0x1E4F28B98];
  v7 = [MEMORY[0x1E4F28C68] expressionForKeyPath:@"senderList.emailAddressValue.simpleAddress"];
  v8 = [MEMORY[0x1E4F28C68] expressionForConstantValue:v5];
  v9 = [v6 predicateWithLeftExpression:v7 rightExpression:v8 modifier:2 type:a4 options:1];

  v10 = (void *)MEMORY[0x1E4F28B98];
  v11 = [MEMORY[0x1E4F28C68] expressionForKeyPath:@"senderList.emailAddressValue.displayName"];
  v12 = [MEMORY[0x1E4F28C68] expressionForConstantValue:v5];
  v13 = [v10 predicateWithLeftExpression:v11 rightExpression:v12 modifier:2 type:a4 options:1];

  v14 = (void *)MEMORY[0x1E4F28BA0];
  v18[0] = v9;
  v18[1] = v13;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:2];
  v16 = [v14 orPredicateWithSubpredicates:v15];

  return v16;
}

+ (id)spotlightSubjectSearchPredicateForValue:(id)a3 operator:(unint64_t)a4
{
  id v5 = a3;
  v6 = (void *)MEMORY[0x1E4F28B98];
  v7 = [MEMORY[0x1E4F28C68] expressionForKeyPath:@"subject.subjectWithoutPrefix"];
  v8 = [MEMORY[0x1E4F28C68] expressionForConstantValue:v5];
  v9 = [v6 predicateWithLeftExpression:v7 rightExpression:v8 modifier:0 type:a4 options:1];

  return v9;
}

+ (id)spotlightBodySearchPredicateForValue:(id)a3
{
  id v3 = a3;
  id v4 = (void *)MEMORY[0x1E4F28B98];
  id v5 = [MEMORY[0x1E4F28C68] expressionForKeyPath:@"body"];
  v6 = [MEMORY[0x1E4F28C68] expressionForConstantValue:v3];
  v7 = [v4 predicateWithLeftExpression:v5 rightExpression:v6 modifier:0 type:99 options:1];

  return v7;
}

+ (id)spotlightUserQueryStringPredicateForValue:(id)a3
{
  id v3 = a3;
  id v4 = (void *)MEMORY[0x1E4F28B98];
  id v5 = [MEMORY[0x1E4F28C68] expressionForKeyPath:@"Spotlight"];
  v6 = [MEMORY[0x1E4F28C68] expressionForConstantValue:v3];
  v7 = [v4 predicateWithLeftExpression:v5 rightExpression:v6 modifier:0 type:99 options:0];

  return v7;
}

+ (id)spotlightQueryPredicateForString:(id)a3
{
  id v3 = a3;
  id v4 = (void *)MEMORY[0x1E4F28B98];
  id v5 = [MEMORY[0x1E4F28C68] expressionForKeyPath:@"SpotlightQuery"];
  v6 = [MEMORY[0x1E4F28C68] expressionForConstantValue:v3];
  v7 = [v4 predicateWithLeftExpression:v5 rightExpression:v6 modifier:0 type:99 options:0];

  return v7;
}

@end