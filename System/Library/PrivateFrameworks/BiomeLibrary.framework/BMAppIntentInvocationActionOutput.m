@interface BMAppIntentInvocationActionOutput
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMAppIntentInvocationAction)nextAction;
- (BMAppIntentInvocationAction)showOutputAction;
- (BMAppIntentInvocationActionOutput)initWithIdentifier:(id)a3 showOutputAction:(id)a4 showOutputActionHint:(int)a5 dialog:(id)a6 value:(id)a7 nextAction:(id)a8 confirmationActionName:(id)a9 showPrompt:(id)a10;
- (BMAppIntentInvocationActionOutput)initWithIdentifier:(id)a3 showOutputAction:(id)a4 showOutputActionHint:(int)a5 dialog:(id)a6 value:(id)a7 nextAction:(id)a8 confirmationActionName:(id)a9 showPrompt:(id)a10 suggestedFollowUpActions:(id)a11;
- (BMAppIntentInvocationActionOutput)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMAppIntentInvocationActionOutputConfirmationActionName)confirmationActionName;
- (BMAppIntentInvocationActionOutputDialog)dialog;
- (BMAppIntentInvocationValue)value;
- (BOOL)hasShowPrompt;
- (BOOL)isEqual:(id)a3;
- (BOOL)showPrompt;
- (NSArray)suggestedFollowUpActions;
- (NSString)description;
- (NSUUID)identifier;
- (id)_suggestedFollowUpActionsJSONArray;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int)showOutputActionHint;
- (unsigned)dataVersion;
- (void)setHasShowPrompt:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMAppIntentInvocationActionOutput

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestedFollowUpActions, 0);
  objc_storeStrong((id *)&self->_confirmationActionName, 0);
  objc_storeStrong((id *)&self->_nextAction, 0);
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_dialog, 0);
  objc_storeStrong((id *)&self->_showOutputAction, 0);

  objc_storeStrong((id *)&self->_raw_identifier, 0);
}

- (NSArray)suggestedFollowUpActions
{
  return self->_suggestedFollowUpActions;
}

- (void)setHasShowPrompt:(BOOL)a3
{
  self->_hasShowPrompt = a3;
}

- (BOOL)hasShowPrompt
{
  return self->_hasShowPrompt;
}

- (BOOL)showPrompt
{
  return self->_showPrompt;
}

- (BMAppIntentInvocationActionOutputConfirmationActionName)confirmationActionName
{
  return self->_confirmationActionName;
}

- (BMAppIntentInvocationAction)nextAction
{
  return self->_nextAction;
}

- (BMAppIntentInvocationValue)value
{
  return self->_value;
}

- (BMAppIntentInvocationActionOutputDialog)dialog
{
  return self->_dialog;
}

- (int)showOutputActionHint
{
  return self->_showOutputActionHint;
}

- (BMAppIntentInvocationAction)showOutputAction
{
  return self->_showOutputAction;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = [(BMAppIntentInvocationActionOutput *)self identifier];
    uint64_t v7 = [v5 identifier];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMAppIntentInvocationActionOutput *)self identifier];
      v10 = [v5 identifier];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_33;
      }
    }
    v13 = [(BMAppIntentInvocationActionOutput *)self showOutputAction];
    uint64_t v14 = [v5 showOutputAction];
    if (v13 == (void *)v14)
    {
    }
    else
    {
      v15 = (void *)v14;
      v16 = [(BMAppIntentInvocationActionOutput *)self showOutputAction];
      v17 = [v5 showOutputAction];
      int v18 = [v16 isEqual:v17];

      if (!v18) {
        goto LABEL_33;
      }
    }
    int v19 = [(BMAppIntentInvocationActionOutput *)self showOutputActionHint];
    if (v19 == [v5 showOutputActionHint])
    {
      v20 = [(BMAppIntentInvocationActionOutput *)self dialog];
      uint64_t v21 = [v5 dialog];
      if (v20 == (void *)v21)
      {
      }
      else
      {
        v22 = (void *)v21;
        v23 = [(BMAppIntentInvocationActionOutput *)self dialog];
        v24 = [v5 dialog];
        int v25 = [v23 isEqual:v24];

        if (!v25) {
          goto LABEL_33;
        }
      }
      v26 = [(BMAppIntentInvocationActionOutput *)self value];
      uint64_t v27 = [v5 value];
      if (v26 == (void *)v27)
      {
      }
      else
      {
        v28 = (void *)v27;
        v29 = [(BMAppIntentInvocationActionOutput *)self value];
        v30 = [v5 value];
        int v31 = [v29 isEqual:v30];

        if (!v31) {
          goto LABEL_33;
        }
      }
      v32 = [(BMAppIntentInvocationActionOutput *)self nextAction];
      uint64_t v33 = [v5 nextAction];
      if (v32 == (void *)v33)
      {
      }
      else
      {
        v34 = (void *)v33;
        v35 = [(BMAppIntentInvocationActionOutput *)self nextAction];
        v36 = [v5 nextAction];
        int v37 = [v35 isEqual:v36];

        if (!v37) {
          goto LABEL_33;
        }
      }
      v38 = [(BMAppIntentInvocationActionOutput *)self confirmationActionName];
      uint64_t v39 = [v5 confirmationActionName];
      if (v38 == (void *)v39)
      {
      }
      else
      {
        v40 = (void *)v39;
        v41 = [(BMAppIntentInvocationActionOutput *)self confirmationActionName];
        v42 = [v5 confirmationActionName];
        int v43 = [v41 isEqual:v42];

        if (!v43) {
          goto LABEL_33;
        }
      }
      if (![(BMAppIntentInvocationActionOutput *)self hasShowPrompt]
        && ![v5 hasShowPrompt]
        || [(BMAppIntentInvocationActionOutput *)self hasShowPrompt]
        && [v5 hasShowPrompt]
        && (int v44 = [(BMAppIntentInvocationActionOutput *)self showPrompt],
            v44 == [v5 showPrompt]))
      {
        v46 = [(BMAppIntentInvocationActionOutput *)self suggestedFollowUpActions];
        v47 = [v5 suggestedFollowUpActions];
        if (v46 == v47)
        {
          char v12 = 1;
        }
        else
        {
          v48 = [(BMAppIntentInvocationActionOutput *)self suggestedFollowUpActions];
          v49 = [v5 suggestedFollowUpActions];
          char v12 = [v48 isEqual:v49];
        }
        goto LABEL_34;
      }
    }
LABEL_33:
    char v12 = 0;
LABEL_34:

    goto LABEL_35;
  }
  char v12 = 0;
LABEL_35:

  return v12;
}

- (NSUUID)identifier
{
  raw_identifier = self->_raw_identifier;
  if (raw_identifier)
  {
    v3 = [MEMORY[0x1E4F50320] convertValue:raw_identifier toType:3];
  }
  else
  {
    v3 = 0;
  }

  return (NSUUID *)v3;
}

- (id)jsonDictionary
{
  v39[9] = *MEMORY[0x1E4F143B8];
  v3 = [(BMAppIntentInvocationActionOutput *)self identifier];
  uint64_t v4 = [v3 UUIDString];

  id v5 = [(BMAppIntentInvocationActionOutput *)self showOutputAction];
  uint64_t v6 = [v5 jsonDictionary];

  uint64_t v7 = objc_msgSend(NSNumber, "numberWithInt:", -[BMAppIntentInvocationActionOutput showOutputActionHint](self, "showOutputActionHint"));
  v8 = [(BMAppIntentInvocationActionOutput *)self dialog];
  uint64_t v9 = [v8 jsonDictionary];

  v10 = [(BMAppIntentInvocationActionOutput *)self value];
  uint64_t v11 = [v10 jsonDictionary];

  char v12 = [(BMAppIntentInvocationActionOutput *)self nextAction];
  int v37 = [v12 jsonDictionary];

  v13 = [(BMAppIntentInvocationActionOutput *)self confirmationActionName];
  v36 = [v13 jsonDictionary];

  if ([(BMAppIntentInvocationActionOutput *)self hasShowPrompt])
  {
    uint64_t v14 = objc_msgSend(NSNumber, "numberWithBool:", -[BMAppIntentInvocationActionOutput showPrompt](self, "showPrompt"));
  }
  else
  {
    uint64_t v14 = 0;
  }
  v15 = [(BMAppIntentInvocationActionOutput *)self _suggestedFollowUpActionsJSONArray];
  v38[0] = @"identifier";
  uint64_t v16 = v4;
  if (!v4)
  {
    uint64_t v16 = [MEMORY[0x1E4F1CA98] null];
  }
  v32 = (void *)v16;
  v39[0] = v16;
  v38[1] = @"showOutputAction";
  uint64_t v17 = v6;
  if (!v6)
  {
    uint64_t v17 = [MEMORY[0x1E4F1CA98] null];
  }
  int v31 = (void *)v17;
  v39[1] = v17;
  v38[2] = @"showOutputActionHint";
  uint64_t v18 = v7;
  if (!v7)
  {
    uint64_t v18 = [MEMORY[0x1E4F1CA98] null];
  }
  v35 = (void *)v4;
  v30 = (void *)v18;
  v39[2] = v18;
  v38[3] = @"dialog";
  uint64_t v19 = v9;
  if (!v9)
  {
    uint64_t v19 = [MEMORY[0x1E4F1CA98] null];
  }
  v34 = (void *)v6;
  v29 = (void *)v19;
  v39[3] = v19;
  v38[4] = @"value";
  v20 = (void *)v11;
  if (!v11)
  {
    v20 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v33 = (void *)v7;
  v39[4] = v20;
  v38[5] = @"nextAction";
  uint64_t v21 = v37;
  if (!v37)
  {
    uint64_t v21 = [MEMORY[0x1E4F1CA98] null];
  }
  v22 = (void *)v9;
  v39[5] = v21;
  v38[6] = @"confirmationActionName";
  v23 = v36;
  if (!v36)
  {
    v23 = [MEMORY[0x1E4F1CA98] null];
  }
  v24 = (void *)v11;
  v39[6] = v23;
  v38[7] = @"showPrompt";
  int v25 = v14;
  if (!v14)
  {
    int v25 = [MEMORY[0x1E4F1CA98] null];
  }
  v39[7] = v25;
  v38[8] = @"suggestedFollowUpActions";
  v26 = v15;
  if (!v15)
  {
    v26 = [MEMORY[0x1E4F1CA98] null];
  }
  v39[8] = v26;
  uint64_t v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v39 forKeys:v38 count:9];
  if (v15)
  {
    if (v14) {
      goto LABEL_24;
    }
  }
  else
  {

    if (v14) {
      goto LABEL_24;
    }
  }

LABEL_24:
  if (!v36) {

  }
  if (!v37) {
  if (!v24)
  }

  if (!v22) {
  if (v33)
  }
  {
    if (v34) {
      goto LABEL_34;
    }
LABEL_41:

    if (v35) {
      goto LABEL_35;
    }
    goto LABEL_42;
  }

  if (!v34) {
    goto LABEL_41;
  }
LABEL_34:
  if (v35) {
    goto LABEL_35;
  }
LABEL_42:

LABEL_35:

  return v27;
}

- (id)_suggestedFollowUpActionsJSONArray
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = [(BMAppIntentInvocationActionOutput *)self suggestedFollowUpActions];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = [*(id *)(*((void *)&v11 + 1) + 8 * i) jsonDictionary];
        [v3 addObject:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (BMAppIntentInvocationActionOutput)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v190[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = [v5 objectForKeyedSubscript:@"identifier"];
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        id v18 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v19 = a4;
        uint64_t v20 = *MEMORY[0x1E4F502C8];
        uint64_t v187 = *MEMORY[0x1E4F28568];
        uint64_t v21 = [[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"identifier"];
        uint64_t v188 = v21;
        v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v188 forKeys:&v187 count:1];
        v22 = v18;
        uint64_t v7 = (void *)v21;
        id v23 = (id)[v22 initWithDomain:v20 code:2 userInfo:v8];
        a4 = 0;
        *uint64_t v19 = v23;
        goto LABEL_126;
      }
      goto LABEL_128;
    }
    long long v12 = a4;
    id v13 = v6;
    uint64_t v14 = [objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v13];
    if (!v14)
    {
      id v86 = v13;
      if (v12)
      {
        id v87 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v88 = *MEMORY[0x1E4F502C8];
        uint64_t v189 = *MEMORY[0x1E4F28568];
        v8 = (void *)[[NSString alloc] initWithFormat:@"-initWithUUIDString: for %@ returned nil", @"identifier"];
        v190[0] = v8;
        v89 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v190 forKeys:&v189 count:1];
        *long long v12 = (id)[v87 initWithDomain:v88 code:2 userInfo:v89];

        a4 = 0;
        uint64_t v7 = v86;
        goto LABEL_126;
      }
      a4 = 0;
      uint64_t v7 = v86;
      goto LABEL_127;
    }
    uint64_t v7 = (void *)v14;

    a4 = v12;
  }
  else
  {
    uint64_t v7 = 0;
  }
  v8 = [v5 objectForKeyedSubscript:@"showOutputAction"];
  if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        v24 = v7;
        id v25 = objc_alloc(MEMORY[0x1E4F28C58]);
        v26 = a4;
        uint64_t v27 = *MEMORY[0x1E4F502C8];
        uint64_t v185 = *MEMORY[0x1E4F28568];
        uint64_t v28 = [[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"showOutputAction"];
        uint64_t v186 = v28;
        id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v186 forKeys:&v185 count:1];
        v29 = v25;
        uint64_t v7 = v24;
        uint64_t v9 = (BMAppIntentInvocationAction *)v28;
        id v30 = (id)[v29 initWithDomain:v27 code:2 userInfo:v11];
        a4 = 0;
        id *v26 = v30;
        goto LABEL_125;
      }
      goto LABEL_126;
    }
    id v11 = v8;
    id v165 = 0;
    uint64_t v9 = [[BMAppIntentInvocationAction alloc] initWithJSONDictionary:v11 error:&v165];
    id v15 = v165;
    if (v15)
    {
      uint64_t v16 = v15;
      if (a4) {
        *a4 = v15;
      }

      a4 = 0;
      goto LABEL_125;
    }
  }
  else
  {
    uint64_t v9 = 0;
  }
  v10 = [v5 objectForKeyedSubscript:@"showOutputActionHint"];
  if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v17 = v10;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (a4)
        {
          v96 = v7;
          id v97 = objc_alloc(MEMORY[0x1E4F28C58]);
          v130 = a4;
          uint64_t v98 = *MEMORY[0x1E4F502C8];
          uint64_t v183 = *MEMORY[0x1E4F28568];
          id v46 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"showOutputActionHint"];
          id v184 = v46;
          v60 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v184 forKeys:&v183 count:1];
          v99 = v97;
          uint64_t v7 = v96;
          id v100 = (id)[v99 initWithDomain:v98 code:2 userInfo:v60];
          id v11 = 0;
          a4 = 0;
          id *v130 = v100;
          goto LABEL_122;
        }
        id v11 = 0;
        goto LABEL_124;
      }
      id v17 = [NSNumber numberWithInt:BMAppIntentInvocationActionOutputHintFromString(v10)];
    }
    id v11 = v17;
  }
  else
  {
    id v11 = 0;
  }
  int v31 = [v5 objectForKeyedSubscript:@"dialog"];
  v153 = v11;
  if (v31 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        v137 = v10;
        v142 = v9;
        v56 = v7;
        id v57 = objc_alloc(MEMORY[0x1E4F28C58]);
        v129 = a4;
        uint64_t v58 = *MEMORY[0x1E4F502C8];
        uint64_t v181 = *MEMORY[0x1E4F28568];
        v59 = v31;
        v60 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"dialog"];
        v182 = v60;
        v61 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v182 forKeys:&v181 count:1];
        v62 = v57;
        uint64_t v7 = v56;
        v10 = v137;
        id *v129 = (id)[v62 initWithDomain:v58 code:2 userInfo:v61];

        a4 = 0;
        id v46 = v59;
        uint64_t v9 = v142;
        goto LABEL_122;
      }
      goto LABEL_123;
    }
    v45 = v7;
    id v46 = v31;
    id v164 = 0;
    v152 = [[BMAppIntentInvocationActionOutputDialog alloc] initWithJSONDictionary:v46 error:&v164];
    id v47 = v164;
    if (v47)
    {
      v48 = v47;
      if (a4) {
        *a4 = v47;
      }

      a4 = 0;
      uint64_t v7 = v45;
      id v11 = v153;
      goto LABEL_121;
    }
    v32 = v6;
    uint64_t v33 = v9;

    v150 = v45;
    id v11 = v153;
  }
  else
  {
    v150 = v7;
    v32 = v6;
    uint64_t v33 = v9;
    v152 = 0;
  }
  uint64_t v34 = [v5 objectForKeyedSubscript:@"value"];
  v154 = v31;
  v149 = (void *)v34;
  if (v34 && (v35 = (void *)v34, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        v143 = v33;
        id v79 = objc_alloc(MEMORY[0x1E4F28C58]);
        v138 = v10;
        v80 = a4;
        uint64_t v81 = *MEMORY[0x1E4F502C8];
        uint64_t v179 = *MEMORY[0x1E4F28568];
        id v82 = [NSString alloc];
        uint64_t v125 = objc_opt_class();
        v83 = v82;
        int v31 = v154;
        v52 = (BMAppIntentInvocationValue *)[v83 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", v125, @"value"];
        v180 = v52;
        uint64_t v84 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v180 forKeys:&v179 count:1];
        id v85 = (id)[v79 initWithDomain:v81 code:2 userInfo:v84];
        a4 = 0;
        id *v80 = v85;
        id v11 = v153;
        uint64_t v6 = v32;
        v36 = (void *)v84;
        v10 = v138;
        uint64_t v9 = v143;
        goto LABEL_119;
      }
      id v11 = v153;
      uint64_t v9 = v33;
      uint64_t v6 = v32;
      goto LABEL_120;
    }
    id v49 = v35;
    id v163 = 0;
    v148 = [[BMAppIntentInvocationValue alloc] initWithJSONDictionary:v49 error:&v163];
    id v50 = v163;
    if (v50)
    {
      v51 = v50;
      id v132 = v49;
      id v11 = v153;
      uint64_t v9 = v33;
      if (a4) {
        *a4 = v50;
      }

      a4 = 0;
      uint64_t v6 = v32;
      v52 = v148;
      v36 = v132;
      goto LABEL_119;
    }

    id v11 = v153;
  }
  else
  {
    v148 = 0;
  }
  uint64_t v9 = v33;
  [v5 objectForKeyedSubscript:@"nextAction"];
  v36 = uint64_t v6 = v32;
  if (v36)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v53 = v36;
        id v162 = 0;
        v147 = [[BMAppIntentInvocationAction alloc] initWithJSONDictionary:v53 error:&v162];
        id v54 = v162;
        if (!v54)
        {
          v145 = v6;
          int v37 = v9;

          id v11 = v153;
          goto LABEL_36;
        }
        v55 = v54;
        v146 = v53;
        id v11 = v153;
        if (a4) {
          *a4 = v54;
        }

        a4 = 0;
      }
      else
      {
        if (!a4)
        {
          id v11 = v153;
          v52 = v148;
          goto LABEL_119;
        }
        v144 = v9;
        id v90 = objc_alloc(MEMORY[0x1E4F28C58]);
        v139 = v10;
        v91 = a4;
        uint64_t v92 = *MEMORY[0x1E4F502C8];
        uint64_t v177 = *MEMORY[0x1E4F28568];
        v147 = (BMAppIntentInvocationAction *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"nextAction"];
        v178 = v147;
        uint64_t v93 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v178 forKeys:&v177 count:1];
        v94 = v90;
        uint64_t v9 = v144;
        v146 = (void *)v93;
        id v95 = (id)objc_msgSend(v94, "initWithDomain:code:userInfo:", v92, 2);
        a4 = 0;
        id *v91 = v95;
        v10 = v139;
        id v11 = v153;
      }
      v52 = v148;
      goto LABEL_118;
    }
  }
  v145 = v6;
  int v37 = v9;
  v147 = 0;
LABEL_36:
  uint64_t v38 = [v5 objectForKeyedSubscript:@"confirmationActionName"];
  v146 = (void *)v38;
  if (v38)
  {
    uint64_t v39 = (void *)v38;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v76 = v39;
        id v161 = 0;
        v135 = [[BMAppIntentInvocationActionOutputConfirmationActionName alloc] initWithJSONDictionary:v76 error:&v161];
        id v77 = v161;
        if (!v77)
        {

          id v11 = v153;
          goto LABEL_39;
        }
        v78 = v77;
        id v134 = v76;
        id v11 = v153;
        uint64_t v9 = v37;
        if (a4) {
          *a4 = v77;
        }

        a4 = 0;
      }
      else
      {
        if (!a4)
        {
          id v11 = v153;
          v52 = v148;
          uint64_t v9 = v37;
          uint64_t v6 = v145;
          goto LABEL_118;
        }
        id v101 = objc_alloc(MEMORY[0x1E4F28C58]);
        v140 = v10;
        v102 = a4;
        uint64_t v103 = *MEMORY[0x1E4F502C8];
        uint64_t v175 = *MEMORY[0x1E4F28568];
        id v104 = [NSString alloc];
        uint64_t v126 = objc_opt_class();
        v105 = v104;
        int v31 = v154;
        v135 = (BMAppIntentInvocationActionOutputConfirmationActionName *)[v105 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", v126, @"confirmationActionName"];
        v176 = v135;
        uint64_t v106 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v176 forKeys:&v175 count:1];
        v107 = v101;
        uint64_t v9 = v37;
        id v134 = (id)v106;
        id v108 = (id)objc_msgSend(v107, "initWithDomain:code:userInfo:", v103, 2);
        a4 = 0;
        id *v102 = v108;
        v10 = v140;
        id v11 = v153;
      }
      v52 = v148;
      uint64_t v6 = v145;
      goto LABEL_117;
    }
  }
  v135 = 0;
LABEL_39:
  uint64_t v9 = v37;
  uint64_t v40 = [v5 objectForKeyedSubscript:@"showPrompt"];
  uint64_t v6 = v145;
  v131 = v36;
  v127 = (void *)v40;
  if (v40 && (v41 = (void *)v40, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (!a4)
      {
        id v134 = 0;
        v52 = v148;
        goto LABEL_116;
      }
      v109 = a4;
      id v110 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v111 = *MEMORY[0x1E4F502C8];
      uint64_t v173 = *MEMORY[0x1E4F28568];
      id obj = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"showPrompt"];
      id v174 = obj;
      v65 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v174 forKeys:&v173 count:1];
      uint64_t v112 = v111;
      int v31 = v154;
      id v113 = (id)[v110 initWithDomain:v112 code:2 userInfo:v65];
      a4 = 0;
      id v134 = 0;
      id *v109 = v113;
      goto LABEL_113;
    }
    v128 = a4;
    id v134 = v41;
  }
  else
  {
    v128 = a4;
    id v134 = 0;
  }
  v42 = [v5 objectForKeyedSubscript:@"suggestedFollowUpActions"];
  int v43 = [MEMORY[0x1E4F1CA98] null];
  int v44 = [v42 isEqual:v43];

  if (!v44)
  {
    if (!v42 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v136 = v10;
      v141 = v9;
      goto LABEL_64;
    }
    if (!v128)
    {
      a4 = 0;
      id v11 = v153;
      v52 = v148;
      goto LABEL_115;
    }
    id obj = v42;
    id v121 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v122 = *MEMORY[0x1E4F502C8];
    uint64_t v171 = *MEMORY[0x1E4F28568];
    v65 = (void *)[[NSString alloc] initWithFormat:@"Expecting %@ as an array", @"suggestedFollowUpActions"];
    v172 = v65;
    v123 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v172 forKeys:&v171 count:1];
    id *v128 = (id)[v121 initWithDomain:v122 code:2 userInfo:v123];

    int v31 = v154;
    a4 = 0;
LABEL_113:
    id v11 = v153;
    v52 = v148;
    goto LABEL_114;
  }
  v136 = v10;
  v141 = v9;

  v42 = 0;
LABEL_64:
  uint64_t v63 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v42, "count"));
  v64 = v42;
  v65 = (void *)v63;
  long long v157 = 0u;
  long long v158 = 0u;
  long long v159 = 0u;
  long long v160 = 0u;
  id obj = v64;
  uint64_t v66 = [obj countByEnumeratingWithState:&v157 objects:v170 count:16];
  if (!v66) {
    goto LABEL_74;
  }
  uint64_t v67 = v66;
  uint64_t v68 = *(void *)v158;
  v69 = v8;
  v151 = v65;
  while (2)
  {
    for (uint64_t i = 0; i != v67; ++i)
    {
      if (*(void *)v158 != v68) {
        objc_enumerationMutation(obj);
      }
      v71 = *(void **)(*((void *)&v157 + 1) + 8 * i);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v6 = v145;
        v114 = v128;
        v10 = v136;
        if (v128)
        {
          id v115 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v116 = *MEMORY[0x1E4F502C8];
          uint64_t v168 = *MEMORY[0x1E4F28568];
          id v72 = (id)[[NSString alloc] initWithFormat:@"Unexpected type null for element of %@, must not be null", @"suggestedFollowUpActions"];
          id v169 = v72;
          v117 = (void *)MEMORY[0x1E4F1C9E8];
          v118 = &v169;
          v119 = &v168;
LABEL_103:
          v120 = [v117 dictionaryWithObjects:v118 forKeys:v119 count:1];
          id *v114 = (id)[v115 initWithDomain:v116 code:2 userInfo:v120];
LABEL_107:

          v8 = v69;
          int v31 = v154;
        }
LABEL_108:

        a4 = 0;
        uint64_t v9 = v141;
        id v11 = v153;
        v52 = v148;
        v65 = v151;
        goto LABEL_114;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        uint64_t v6 = v145;
        v114 = v128;
        v10 = v136;
        if (v128)
        {
          id v115 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v116 = *MEMORY[0x1E4F502C8];
          uint64_t v166 = *MEMORY[0x1E4F28568];
          id v72 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"suggestedFollowUpActions"];
          id v167 = v72;
          v117 = (void *)MEMORY[0x1E4F1C9E8];
          v118 = &v167;
          v119 = &v166;
          goto LABEL_103;
        }
        goto LABEL_108;
      }
      id v72 = v71;
      v73 = [BMAppIntentInvocationAction alloc];
      id v156 = 0;
      v74 = [(BMAppIntentInvocationAction *)v73 initWithJSONDictionary:v72 error:&v156];
      id v75 = v156;
      if (v75)
      {
        v120 = v75;
        if (v128) {
          id *v128 = v75;
        }

        uint64_t v6 = v145;
        v10 = v136;
        goto LABEL_107;
      }
      [v151 addObject:v74];

      v8 = v69;
      int v31 = v154;
    }
    uint64_t v67 = [obj countByEnumeratingWithState:&v157 objects:v170 count:16];
    v65 = v151;
    if (v67) {
      continue;
    }
    break;
  }
LABEL_74:

  id v11 = v153;
  uint64_t v9 = v141;
  v52 = v148;
  a4 = -[BMAppIntentInvocationActionOutput initWithIdentifier:showOutputAction:showOutputActionHint:dialog:value:nextAction:confirmationActionName:showPrompt:suggestedFollowUpActions:](self, "initWithIdentifier:showOutputAction:showOutputActionHint:dialog:value:nextAction:confirmationActionName:showPrompt:suggestedFollowUpActions:", v150, v141, [v153 intValue], v152, v148, v147, v135, v134, v65);
  self = (BMAppIntentInvocationActionOutput *)a4;
  uint64_t v6 = v145;
  v10 = v136;
LABEL_114:

  v42 = obj;
LABEL_115:

  v36 = v131;
LABEL_116:

LABEL_117:
LABEL_118:

LABEL_119:
LABEL_120:

  id v46 = v31;
  uint64_t v7 = v150;
LABEL_121:
  v60 = v152;
LABEL_122:

  int v31 = v46;
LABEL_123:

LABEL_124:
LABEL_125:

LABEL_126:
LABEL_127:

LABEL_128:
  return (BMAppIntentInvocationActionOutput *)a4;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMAppIntentInvocationActionOutput *)self writeTo:v3];
  uint64_t v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_raw_identifier) {
    PBDataWriterWriteDataField();
  }
  if (self->_showOutputAction)
  {
    uint64_t v15 = 0;
    PBDataWriterPlaceMark();
    [(BMAppIntentInvocationAction *)self->_showOutputAction writeTo:v4];
    PBDataWriterRecallMark();
  }
  PBDataWriterWriteUint32Field();
  if (self->_dialog)
  {
    uint64_t v15 = 0;
    PBDataWriterPlaceMark();
    [(BMAppIntentInvocationActionOutputDialog *)self->_dialog writeTo:v4];
    PBDataWriterRecallMark();
  }
  if (self->_value)
  {
    uint64_t v15 = 0;
    PBDataWriterPlaceMark();
    [(BMAppIntentInvocationValue *)self->_value writeTo:v4];
    PBDataWriterRecallMark();
  }
  if (self->_nextAction)
  {
    uint64_t v15 = 0;
    PBDataWriterPlaceMark();
    [(BMAppIntentInvocationAction *)self->_nextAction writeTo:v4];
    PBDataWriterRecallMark();
  }
  if (self->_confirmationActionName)
  {
    uint64_t v15 = 0;
    PBDataWriterPlaceMark();
    [(BMAppIntentInvocationActionOutputConfirmationActionName *)self->_confirmationActionName writeTo:v4];
    PBDataWriterRecallMark();
  }
  if (self->_hasShowPrompt) {
    PBDataWriterWriteBOOLField();
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = self->_suggestedFollowUpActions;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v11 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v11 + 1) + 8 * v9);
        uint64_t v15 = 0;
        PBDataWriterPlaceMark();
        objc_msgSend(v10, "writeTo:", v4, (void)v11);
        PBDataWriterRecallMark();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v11 objects:v16 count:16];
    }
    while (v7);
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v47.receiver = self;
  v47.super_class = (Class)BMAppIntentInvocationActionOutput;
  id v5 = [(BMEventBase *)&v47 init];
  if (!v5) {
    goto LABEL_70;
  }
  uint64_t v6 = objc_opt_new();
  uint64_t v7 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v8 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v9 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)&v4[*MEMORY[0x1E4F940E8]] < *(void *)&v4[*MEMORY[0x1E4F940E0]])
  {
    v10 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (v4[*v9]) {
        break;
      }
      char v11 = 0;
      unsigned int v12 = 0;
      unint64_t v13 = 0;
      while (1)
      {
        uint64_t v14 = *v7;
        uint64_t v15 = *(void *)&v4[v14];
        unint64_t v16 = v15 + 1;
        if (v15 == -1 || v16 > *(void *)&v4[*v8]) {
          break;
        }
        char v17 = *(unsigned char *)(*(void *)&v4[*v10] + v15);
        *(void *)&v4[v14] = v16;
        v13 |= (unint64_t)(v17 & 0x7F) << v11;
        if ((v17 & 0x80) == 0) {
          goto LABEL_13;
        }
        v11 += 7;
        BOOL v18 = v12++ >= 9;
        if (v18)
        {
          unint64_t v13 = 0;
          int v19 = v4[*v9];
          goto LABEL_15;
        }
      }
      v4[*v9] = 1;
LABEL_13:
      int v19 = v4[*v9];
      if (v4[*v9]) {
        unint64_t v13 = 0;
      }
LABEL_15:
      if (v19 || (v13 & 7) == 4) {
        break;
      }
      switch((v13 >> 3))
      {
        case 1u:
          PBReaderReadData();
          uint64_t v21 = (NSData *)objc_claimAutoreleasedReturnValue();
          if ([(NSData *)v21 length] == 16)
          {
            raw_identifier = v5->_raw_identifier;
            v5->_raw_identifier = v21;

            continue;
          }

          goto LABEL_72;
        case 2u:
          uint64_t v48 = 0;
          uint64_t v49 = 0;
          if ((PBReaderPlaceMark() & 1) == 0) {
            goto LABEL_72;
          }
          id v23 = [[BMAppIntentInvocationAction alloc] initByReadFrom:v4];
          if (!v23) {
            goto LABEL_72;
          }
          uint64_t v24 = 40;
          goto LABEL_46;
        case 3u:
          char v25 = 0;
          unsigned int v26 = 0;
          uint64_t v27 = 0;
          while (2)
          {
            uint64_t v28 = *v7;
            uint64_t v29 = *(void *)&v4[v28];
            unint64_t v30 = v29 + 1;
            if (v29 == -1 || v30 > *(void *)&v4[*v8])
            {
              v4[*v9] = 1;
            }
            else
            {
              char v31 = *(unsigned char *)(*(void *)&v4[*v10] + v29);
              *(void *)&v4[v28] = v30;
              v27 |= (unint64_t)(v31 & 0x7F) << v25;
              if (v31 < 0)
              {
                v25 += 7;
                BOOL v18 = v26++ >= 9;
                if (v18)
                {
                  LODWORD(v27) = 0;
                  goto LABEL_62;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v9]) {
            LODWORD(v27) = 0;
          }
LABEL_62:
          if (v27 >= 4) {
            LODWORD(v27) = 0;
          }
          v5->_showOutputActionHint = v27;
          continue;
        case 4u:
          uint64_t v48 = 0;
          uint64_t v49 = 0;
          if ((PBReaderPlaceMark() & 1) == 0) {
            goto LABEL_72;
          }
          id v23 = [[BMAppIntentInvocationActionOutputDialog alloc] initByReadFrom:v4];
          if (!v23) {
            goto LABEL_72;
          }
          uint64_t v24 = 48;
          goto LABEL_46;
        case 6u:
          uint64_t v48 = 0;
          uint64_t v49 = 0;
          if ((PBReaderPlaceMark() & 1) == 0) {
            goto LABEL_72;
          }
          id v23 = [[BMAppIntentInvocationValue alloc] initByReadFrom:v4];
          if (!v23) {
            goto LABEL_72;
          }
          uint64_t v24 = 56;
          goto LABEL_46;
        case 8u:
          uint64_t v48 = 0;
          uint64_t v49 = 0;
          if ((PBReaderPlaceMark() & 1) == 0) {
            goto LABEL_72;
          }
          id v23 = [[BMAppIntentInvocationAction alloc] initByReadFrom:v4];
          if (!v23) {
            goto LABEL_72;
          }
          uint64_t v24 = 64;
          goto LABEL_46;
        case 9u:
          uint64_t v48 = 0;
          uint64_t v49 = 0;
          if ((PBReaderPlaceMark() & 1) == 0) {
            goto LABEL_72;
          }
          id v23 = [[BMAppIntentInvocationActionOutputConfirmationActionName alloc] initByReadFrom:v4];
          if (!v23) {
            goto LABEL_72;
          }
          uint64_t v24 = 72;
LABEL_46:
          v32 = *(Class *)((char *)&v5->super.super.isa + v24);
          *(Class *)((char *)&v5->super.super.isa + v24) = v23;

          PBReaderRecallMark();
          continue;
        case 0xAu:
          char v33 = 0;
          unsigned int v34 = 0;
          uint64_t v35 = 0;
          v5->_hasShowPrompt = 1;
          break;
        case 0xBu:
          uint64_t v48 = 0;
          uint64_t v49 = 0;
          if ((PBReaderPlaceMark() & 1) == 0) {
            goto LABEL_72;
          }
          id v40 = [[BMAppIntentInvocationAction alloc] initByReadFrom:v4];
          if (!v40) {
            goto LABEL_72;
          }
          v41 = v40;
          [v6 addObject:v40];
          PBReaderRecallMark();

          continue;
        default:
          if (PBReaderSkipValueWithTag()) {
            continue;
          }
LABEL_72:

          goto LABEL_73;
      }
      while (1)
      {
        uint64_t v36 = *v7;
        uint64_t v37 = *(void *)&v4[v36];
        unint64_t v38 = v37 + 1;
        if (v37 == -1 || v38 > *(void *)&v4[*v8]) {
          break;
        }
        char v39 = *(unsigned char *)(*(void *)&v4[*v10] + v37);
        *(void *)&v4[v36] = v38;
        v35 |= (unint64_t)(v39 & 0x7F) << v33;
        if ((v39 & 0x80) == 0) {
          goto LABEL_66;
        }
        v33 += 7;
        BOOL v18 = v34++ >= 9;
        if (v18)
        {
          uint64_t v35 = 0;
          goto LABEL_68;
        }
      }
      v4[*v9] = 1;
LABEL_66:
      if (v4[*v9]) {
        uint64_t v35 = 0;
      }
LABEL_68:
      v5->_showPrompt = v35 != 0;
    }
    while (*(void *)&v4[*v7] < *(void *)&v4[*v8]);
  }
  uint64_t v42 = [v6 copy];
  suggestedFollowUpActions = v5->_suggestedFollowUpActions;
  v5->_suggestedFollowUpActions = (NSArray *)v42;

  int v44 = v4[*v9];
  if (v44) {
LABEL_73:
  }
    v45 = 0;
  else {
LABEL_70:
  }
    v45 = v5;

  return v45;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = [(BMAppIntentInvocationActionOutput *)self identifier];
  id v5 = [(BMAppIntentInvocationActionOutput *)self showOutputAction];
  uint64_t v6 = BMAppIntentInvocationActionOutputHintAsString([(BMAppIntentInvocationActionOutput *)self showOutputActionHint]);
  uint64_t v7 = [(BMAppIntentInvocationActionOutput *)self dialog];
  uint64_t v8 = [(BMAppIntentInvocationActionOutput *)self value];
  uint64_t v9 = [(BMAppIntentInvocationActionOutput *)self nextAction];
  v10 = [(BMAppIntentInvocationActionOutput *)self confirmationActionName];
  char v11 = objc_msgSend(NSNumber, "numberWithBool:", -[BMAppIntentInvocationActionOutput showPrompt](self, "showPrompt"));
  unsigned int v12 = [(BMAppIntentInvocationActionOutput *)self suggestedFollowUpActions];
  unint64_t v13 = (void *)[v3 initWithFormat:@"BMAppIntentInvocationActionOutput with identifier: %@, showOutputAction: %@, showOutputActionHint: %@, dialog: %@, value: %@, nextAction: %@, confirmationActionName: %@, showPrompt: %@, suggestedFollowUpActions: %@", v4, v5, v6, v7, v8, v9, v10, v11, v12];

  return (NSString *)v13;
}

- (BMAppIntentInvocationActionOutput)initWithIdentifier:(id)a3 showOutputAction:(id)a4 showOutputActionHint:(int)a5 dialog:(id)a6 value:(id)a7 nextAction:(id)a8 confirmationActionName:(id)a9 showPrompt:(id)a10 suggestedFollowUpActions:(id)a11
{
  v30[2] = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  id v28 = a4;
  id v27 = a6;
  id v26 = a7;
  id v25 = a8;
  id v24 = a9;
  id v17 = a10;
  id v18 = a11;
  v29.receiver = self;
  v29.super_class = (Class)BMAppIntentInvocationActionOutput;
  int v19 = [(BMEventBase *)&v29 init];
  if (v19)
  {
    v19->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    if (v16)
    {
      v30[0] = 0;
      v30[1] = 0;
      [v16 getUUIDBytes:v30];
      uint64_t v20 = [objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:v30 length:16];
      raw_identifier = v19->_raw_identifier;
      v19->_raw_identifier = (NSData *)v20;
    }
    else
    {
      raw_identifier = v19->_raw_identifier;
      v19->_raw_identifier = 0;
    }

    objc_storeStrong((id *)&v19->_showOutputAction, a4);
    v19->_showOutputActionHint = a5;
    objc_storeStrong((id *)&v19->_dialog, a6);
    objc_storeStrong((id *)&v19->_value, a7);
    objc_storeStrong((id *)&v19->_nextAction, a8);
    objc_storeStrong((id *)&v19->_confirmationActionName, a9);
    if (v17)
    {
      v19->_hasShowPrompt = 1;
      v19->_showPrompt = [v17 BOOLValue];
    }
    else
    {
      v19->_hasShowPrompt = 0;
      v19->_showPrompt = 0;
    }
    objc_storeStrong((id *)&v19->_suggestedFollowUpActions, a11);
  }

  return v19;
}

+ (id)protoFields
{
  v13[9] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"identifier" number:1 type:14 subMessageClass:0];
  id v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F503E0]), "initWithName:number:type:subMessageClass:", @"showOutputAction", 2, 14, objc_opt_class(), v2);
  v13[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"showOutputActionHint" number:3 type:4 subMessageClass:0];
  v13[2] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"dialog" number:4 type:14 subMessageClass:objc_opt_class()];
  v13[3] = v5;
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"value" number:6 type:14 subMessageClass:objc_opt_class()];
  v13[4] = v6;
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"nextAction" number:8 type:14 subMessageClass:objc_opt_class()];
  v13[5] = v7;
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"confirmationActionName" number:9 type:14 subMessageClass:objc_opt_class()];
  v13[6] = v8;
  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"showPrompt" number:10 type:12 subMessageClass:0];
  v13[7] = v9;
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"suggestedFollowUpActions" number:11 type:14 subMessageClass:objc_opt_class()];
  v13[8] = v10;
  char v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:9];

  return v11;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF50B8;
}

+ (id)columns
{
  v13[9] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"identifier" dataType:6 requestOnly:0 fieldNumber:1 protoDataType:14 convertedType:3];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"showOutputAction_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_970];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"showOutputActionHint" dataType:0 requestOnly:0 fieldNumber:3 protoDataType:4 convertedType:0];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"dialog_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_972];
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"value_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_974];
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"nextAction_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_976];
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"confirmationActionName_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_978];
  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"showPrompt" dataType:0 requestOnly:0 fieldNumber:10 protoDataType:12 convertedType:0];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"suggestedFollowUpActions_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_980];
  v13[0] = v2;
  v13[1] = v3;
  v13[2] = v4;
  v13[3] = v5;
  v13[4] = v6;
  v13[5] = v7;
  v13[6] = v8;
  v13[7] = v9;
  v13[8] = v10;
  char v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:9];

  return v11;
}

id __44__BMAppIntentInvocationActionOutput_columns__block_invoke_6(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 _suggestedFollowUpActionsJSONArray];
  id v4 = BMConvertObjectToJSONString();

  return v4;
}

id __44__BMAppIntentInvocationActionOutput_columns__block_invoke_5(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 confirmationActionName];
  id v4 = [v3 jsonDictionary];
  id v5 = BMConvertObjectToJSONString();

  return v5;
}

id __44__BMAppIntentInvocationActionOutput_columns__block_invoke_4(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 nextAction];
  id v4 = [v3 jsonDictionary];
  id v5 = BMConvertObjectToJSONString();

  return v5;
}

id __44__BMAppIntentInvocationActionOutput_columns__block_invoke_3(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 value];
  id v4 = [v3 jsonDictionary];
  id v5 = BMConvertObjectToJSONString();

  return v5;
}

id __44__BMAppIntentInvocationActionOutput_columns__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 dialog];
  id v4 = [v3 jsonDictionary];
  id v5 = BMConvertObjectToJSONString();

  return v5;
}

id __44__BMAppIntentInvocationActionOutput_columns__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 showOutputAction];
  id v4 = [v3 jsonDictionary];
  id v5 = BMConvertObjectToJSONString();

  return v5;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  if (a4)
  {
    id v4 = 0;
  }
  else
  {
    id v5 = (objc_class *)MEMORY[0x1E4F94090];
    id v6 = a3;
    uint64_t v7 = (void *)[[v5 alloc] initWithData:v6];

    uint64_t v8 = [[BMAppIntentInvocationActionOutput alloc] initByReadFrom:v7];
    id v4 = v8;
    if (v8) {
      v8[7] = 0;
    }
  }

  return v4;
}

+ (unsigned)latestDataVersion
{
  return 0;
}

- (BMAppIntentInvocationActionOutput)initWithIdentifier:(id)a3 showOutputAction:(id)a4 showOutputActionHint:(int)a5 dialog:(id)a6 value:(id)a7 nextAction:(id)a8 confirmationActionName:(id)a9 showPrompt:(id)a10
{
  return [(BMAppIntentInvocationActionOutput *)self initWithIdentifier:a3 showOutputAction:a4 showOutputActionHint:*(void *)&a5 dialog:a6 value:a7 nextAction:a8 confirmationActionName:a9 showPrompt:a10 suggestedFollowUpActions:MEMORY[0x1E4F1CBF0]];
}

@end