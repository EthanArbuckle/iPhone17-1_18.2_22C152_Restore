@interface INIntentTestResolvedParameter
- (BOOL)resolveImplemented;
- (INExtensionContextSlotResolutionResult)extensionContextResolutionResult;
- (INIntent)intent;
- (INIntentSlotDescription)slotDescription;
- (INIntentTestResolvedParameter)initWithParameter:(id)a3 forIntent:(id)a4 extensionContextResolutionResult:(id)a5;
- (NSArray)results;
- (NSString)parameter;
- (id)description;
- (id)descriptionAtIndent:(unint64_t)a3;
- (id)dictionaryRepresentation;
@end

@implementation INIntentTestResolvedParameter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_slotDescription, 0);
  objc_storeStrong((id *)&self->_intent, 0);
  objc_storeStrong((id *)&self->_extensionContextResolutionResult, 0);
  objc_storeStrong((id *)&self->_results, 0);

  objc_storeStrong((id *)&self->_parameter, 0);
}

- (INIntentSlotDescription)slotDescription
{
  return self->_slotDescription;
}

- (INIntent)intent
{
  return self->_intent;
}

- (INExtensionContextSlotResolutionResult)extensionContextResolutionResult
{
  return self->_extensionContextResolutionResult;
}

- (BOOL)resolveImplemented
{
  return self->_resolveImplemented;
}

- (NSArray)results
{
  return self->_results;
}

- (NSString)parameter
{
  return self->_parameter;
}

- (id)dictionaryRepresentation
{
  v11[3] = *MEMORY[0x1E4F143B8];
  v10[0] = @"parameter";
  parameter = self->_parameter;
  v4 = parameter;
  if (!parameter)
  {
    v4 = [MEMORY[0x1E4F1CA98] null];
  }
  v11[0] = v4;
  v10[1] = @"results";
  results = self->_results;
  v6 = results;
  if (!results)
  {
    v6 = [MEMORY[0x1E4F1CA98] null];
  }
  v11[1] = v6;
  v10[2] = @"resolveImplemented";
  v7 = [NSNumber numberWithBool:self->_resolveImplemented];
  v11[2] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:3];

  if (results)
  {
    if (parameter) {
      goto LABEL_7;
    }
  }
  else
  {

    if (parameter) {
      goto LABEL_7;
    }
  }

LABEL_7:

  return v8;
}

- (id)descriptionAtIndent:(unint64_t)a3
{
  v5 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)INIntentTestResolvedParameter;
  v6 = [(INIntentTestResolvedParameter *)&v11 description];
  v7 = [(INIntentTestResolvedParameter *)self dictionaryRepresentation];
  v8 = [v7 descriptionAtIndent:a3];
  v9 = [v5 stringWithFormat:@"%@ %@", v6, v8];

  return v9;
}

- (id)description
{
  return [(INIntentTestResolvedParameter *)self descriptionAtIndent:0];
}

- (INIntentTestResolvedParameter)initWithParameter:(id)a3 forIntent:(id)a4 extensionContextResolutionResult:(id)a5
{
  v27[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v26.receiver = self;
  v26.super_class = (Class)INIntentTestResolvedParameter;
  v12 = [(INIntentTestResolvedParameter *)&v26 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_parameter, a3);
    objc_storeStrong((id *)&v13->_extensionContextResolutionResult, a5);
    uint64_t v14 = [v10 copy];
    intent = v13->_intent;
    v13->_intent = (INIntent *)v14;

    v13->_resolveImplemented = [v11 result] != 2;
    v16 = [v10 _intentInstanceDescription];
    uint64_t v17 = [v16 slotByName:v9];
    slotDescription = v13->_slotDescription;
    v13->_slotDescription = (INIntentSlotDescription *)v17;

    v19 = [v11 data];
    if (!v19) {
      goto LABEL_10;
    }
    v20 = v13->_slotDescription;

    if (!v20) {
      goto LABEL_10;
    }
    v21 = [v11 data];
    v22 = +[INIntentResolutionResult _resolutionResultWithData:v21 slotDescription:v13->_slotDescription];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v23 = v22;
    }
    else
    {
      if (!v22)
      {
LABEL_9:

LABEL_10:
        goto LABEL_11;
      }
      v27[0] = v22;
      v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:1];
    }
    results = v13->_results;
    v13->_results = v23;

    goto LABEL_9;
  }
LABEL_11:

  return v13;
}

@end