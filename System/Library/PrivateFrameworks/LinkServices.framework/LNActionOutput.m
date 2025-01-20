@interface LNActionOutput
+ (BOOL)supportsSecureCoding;
- (BOOL)isDeferred;
- (BOOL)isEqual:(id)a3;
- (BOOL)shouldShowPrompt;
- (LNAction)nextAction;
- (LNAction)showOutputAction;
- (LNActionOutput)initWithCoder:(id)a3;
- (LNActionOutput)initWithIdentifier:(id)a3 dialog:(id)a4 viewSnippet:(id)a5 attribution:(id)a6 value:(id)a7 showOutputAction:(id)a8 showOutputActionHint:(int64_t)a9 showOutputActionOptions:(unint64_t)a10 deferred:(BOOL)a11 nextAction:(id)a12 suggestedFollowUpActions:(id)a13 activityIdentifier:(id)a14 confirmationActionName:(id)a15 showPrompt:(BOOL)a16 confirmationConditions:(int64_t)a17 undoContext:(id)a18;
- (LNActionOutput)initWithIdentifier:(id)a3 dialog:(id)a4 viewSnippet:(id)a5 value:(id)a6 showOutputAction:(id)a7 deferred:(BOOL)a8 nextAction:(id)a9 confirmationActionName:(id)a10;
- (LNActionOutput)initWithIdentifier:(id)a3 dialog:(id)a4 viewSnippet:(id)a5 value:(id)a6 showOutputAction:(id)a7 deferred:(BOOL)a8 nextAction:(id)a9 confirmationActionName:(id)a10 showPrompt:(BOOL)a11;
- (LNActionOutput)initWithIdentifier:(id)a3 dialog:(id)a4 viewSnippet:(id)a5 value:(id)a6 showOutputAction:(id)a7 showOutputActionHint:(int64_t)a8 deferred:(BOOL)a9 nextAction:(id)a10 activityIdentifier:(id)a11 confirmationActionName:(id)a12 showPrompt:(BOOL)a13;
- (LNActionOutput)initWithIdentifier:(id)a3 dialog:(id)a4 viewSnippet:(id)a5 value:(id)a6 showOutputAction:(id)a7 showOutputActionHint:(int64_t)a8 deferred:(BOOL)a9 nextAction:(id)a10 confirmationActionName:(id)a11 showPrompt:(BOOL)a12 undoContext:(id)a13;
- (LNActionOutput)initWithIdentifier:(id)a3 dialog:(id)a4 viewSnippet:(id)a5 value:(id)a6 showOutputAction:(id)a7 showOutputActionHint:(int64_t)a8 deferred:(BOOL)a9 nextAction:(id)a10 suggestedFollowUpActions:(id)a11 activityIdentifier:(id)a12 confirmationActionName:(id)a13 showPrompt:(BOOL)a14 confirmationConditions:(int64_t)a15 undoContext:(id)a16;
- (LNActionOutput)initWithIdentifier:(id)a3 dialog:(id)a4 viewSnippet:(id)a5 value:(id)a6 showOutputAction:(id)a7 showOutputActionHint:(int64_t)a8 showOutputActionOptions:(unint64_t)a9 deferred:(BOOL)a10 nextAction:(id)a11 suggestedFollowUpActions:(id)a12 activityIdentifier:(id)a13 confirmationActionName:(id)a14 showPrompt:(BOOL)a15 confirmationConditions:(int64_t)a16 undoContext:(id)a17;
- (LNAttribution)attribution;
- (LNConfirmationActionName)confirmationActionName;
- (LNDialog)dialog;
- (LNUndoContext)undoContext;
- (LNValue)value;
- (LNViewSnippet)viewSnippet;
- (NSArray)suggestedFollowUpActions;
- (NSString)activityIdentifier;
- (NSUUID)identifier;
- (id)description;
- (int64_t)confirmationConditions;
- (int64_t)showOutputActionHint;
- (unint64_t)hash;
- (unint64_t)showOutputActionOptions;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LNActionOutput

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_undoContext, 0);
  objc_storeStrong((id *)&self->_confirmationActionName, 0);
  objc_storeStrong((id *)&self->_activityIdentifier, 0);
  objc_storeStrong((id *)&self->_suggestedFollowUpActions, 0);
  objc_storeStrong((id *)&self->_nextAction, 0);
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_attribution, 0);
  objc_storeStrong((id *)&self->_viewSnippet, 0);
  objc_storeStrong((id *)&self->_dialog, 0);
  objc_storeStrong((id *)&self->_showOutputAction, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (LNUndoContext)undoContext
{
  return self->_undoContext;
}

- (int64_t)confirmationConditions
{
  return self->_confirmationConditions;
}

- (BOOL)shouldShowPrompt
{
  return self->_showPrompt;
}

- (LNConfirmationActionName)confirmationActionName
{
  return self->_confirmationActionName;
}

- (NSString)activityIdentifier
{
  return self->_activityIdentifier;
}

- (NSArray)suggestedFollowUpActions
{
  return self->_suggestedFollowUpActions;
}

- (LNAction)nextAction
{
  return self->_nextAction;
}

- (BOOL)isDeferred
{
  return self->_deferred;
}

- (LNValue)value
{
  return self->_value;
}

- (LNAttribution)attribution
{
  return self->_attribution;
}

- (LNViewSnippet)viewSnippet
{
  return self->_viewSnippet;
}

- (LNDialog)dialog
{
  return self->_dialog;
}

- (unint64_t)showOutputActionOptions
{
  return self->_showOutputActionOptions;
}

- (int64_t)showOutputActionHint
{
  return self->_showOutputActionHint;
}

- (LNAction)showOutputAction
{
  return self->_showOutputAction;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (LNActionOutput *)a3;
  v5 = v4;
  if (self != v4)
  {
    v6 = v4;
    if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      LOBYTE(v12) = 0;
LABEL_88:

      goto LABEL_89;
    }
    v7 = [(LNActionOutput *)self identifier];
    v8 = [(LNActionOutput *)v6 identifier];
    id v9 = v7;
    id v10 = v8;
    v11 = v10;
    if (v9 == v10)
    {
    }
    else
    {
      LOBYTE(v12) = 0;
      v13 = v10;
      id v14 = v9;
      if (!v9 || !v10) {
        goto LABEL_86;
      }
      int v15 = [v9 isEqual:v10];

      if (!v15)
      {
        LOBYTE(v12) = 0;
LABEL_87:

        goto LABEL_88;
      }
    }
    v16 = [(LNActionOutput *)self dialog];
    v17 = [(LNActionOutput *)v6 dialog];
    id v14 = v16;
    id v18 = v17;
    v13 = v18;
    if (v14 == v18)
    {
    }
    else
    {
      LOBYTE(v12) = 0;
      v19 = v18;
      id v20 = v14;
      if (!v14 || !v18) {
        goto LABEL_85;
      }
      int v21 = [v14 isEqual:v18];

      if (!v21)
      {
        LOBYTE(v12) = 0;
LABEL_86:

        goto LABEL_87;
      }
    }
    v22 = [(LNActionOutput *)self viewSnippet];
    v23 = [(LNActionOutput *)v6 viewSnippet];
    id v20 = v22;
    id v24 = v23;
    v19 = v24;
    id v87 = v20;
    if (v20 == v24)
    {
    }
    else
    {
      LOBYTE(v12) = 0;
      v25 = v24;
      if (!v20 || !v24) {
        goto LABEL_84;
      }
      LODWORD(v12) = [v20 isEqual:v24];

      if (!v12) {
        goto LABEL_85;
      }
    }
    v86 = v19;
    v26 = [(LNActionOutput *)self value];
    v27 = [(LNActionOutput *)self value];
    id v28 = v26;
    id v29 = v27;
    v84 = v29;
    id v85 = v28;
    if (v28 != v29)
    {
      LOBYTE(v12) = 0;
      if (v28)
      {
        v30 = v29;
        v19 = v86;
        if (v29)
        {
          int v31 = [v28 isEqual:v29];

          if (!v31)
          {
            LOBYTE(v12) = 0;
            v19 = v86;
LABEL_83:
            v25 = v84;
            id v20 = v85;
LABEL_84:

            id v20 = v87;
LABEL_85:

            goto LABEL_86;
          }
LABEL_30:
          v32 = [(LNActionOutput *)self showOutputAction];
          v33 = [(LNActionOutput *)self showOutputAction];
          id v28 = v32;
          id v34 = v33;
          id v83 = v34;
          if (v28 != v34)
          {
            LOBYTE(v12) = 0;
            if (v28)
            {
              v35 = v34;
              id v36 = v28;
              v19 = v86;
              if (v34)
              {
                v37 = v34;
                int v38 = [v28 isEqual:v34];

                if (!v38)
                {
LABEL_39:
                  LOBYTE(v12) = 0;
                  v19 = v86;
LABEL_81:
                  v30 = v83;
                  goto LABEL_82;
                }
LABEL_36:
                int64_t v39 = [(LNActionOutput *)self showOutputActionHint];
                if (v39 != [(LNActionOutput *)self showOutputActionHint]) {
                  goto LABEL_39;
                }
                unint64_t v40 = [(LNActionOutput *)self showOutputActionOptions];
                if (v40 != [(LNActionOutput *)self showOutputActionOptions]) {
                  goto LABEL_39;
                }
                BOOL v41 = [(LNActionOutput *)self isDeferred];
                if (v41 != [(LNActionOutput *)v6 isDeferred]) {
                  goto LABEL_39;
                }
                v42 = [(LNActionOutput *)self nextAction];
                v43 = [(LNActionOutput *)v6 nextAction];
                id v44 = v42;
                id v45 = v43;
                v81 = v45;
                v82 = v44;
                if (v44 != v45)
                {
                  LOBYTE(v12) = 0;
                  if (v44)
                  {
                    v46 = v45;
                    id v47 = v44;
                    v19 = v86;
                    if (v45)
                    {
                      int v79 = [v82 isEqual:v45];

                      if (!v79)
                      {
                        LOBYTE(v12) = 0;
                        v19 = v86;
LABEL_79:
                        v35 = v81;
                        id v36 = v82;
                        goto LABEL_80;
                      }
LABEL_48:
                      v48 = [(LNActionOutput *)self suggestedFollowUpActions];
                      v49 = [(LNActionOutput *)v6 suggestedFollowUpActions];
                      id v50 = v48;
                      id v51 = v49;
                      v78 = v51;
                      v80 = v50;
                      if (v50 != v51)
                      {
                        LOBYTE(v12) = 0;
                        if (v50)
                        {
                          v52 = v51;
                          id v53 = v50;
                          v19 = v86;
                          if (v51)
                          {
                            v54 = [MEMORY[0x1E4F1CAD0] setWithArray:v80];
                            v55 = [MEMORY[0x1E4F1CAD0] setWithArray:v78];
                            int v76 = [v54 isEqualToSet:v55];

                            if (!v76)
                            {
                              LOBYTE(v12) = 0;
                              v19 = v86;
LABEL_77:
                              v46 = v78;
                              id v47 = v80;
                              goto LABEL_78;
                            }
LABEL_54:
                            v56 = [(LNActionOutput *)self activityIdentifier];
                            v57 = [(LNActionOutput *)v6 activityIdentifier];
                            id v58 = v56;
                            id v59 = v57;
                            v75 = v59;
                            id v77 = v58;
                            if (v58 == v59)
                            {
                            }
                            else
                            {
                              LOBYTE(v12) = 0;
                              if (!v58)
                              {
                                v60 = v59;
                                goto LABEL_74;
                              }
                              v60 = v59;
                              if (!v59)
                              {
LABEL_74:

                                goto LABEL_75;
                              }
                              int v73 = [v58 isEqual:v59];

                              if (!v73)
                              {
                                LOBYTE(v12) = 0;
LABEL_75:
                                v19 = v86;
                                v52 = v75;
                                id v53 = v77;
                                goto LABEL_76;
                              }
                            }
                            v61 = [(LNActionOutput *)self confirmationActionName];
                            v62 = [(LNActionOutput *)v6 confirmationActionName];
                            id v58 = v61;
                            id v63 = v62;
                            v12 = v63;
                            if (v58 == v63)
                            {
                              id v72 = v63;

                              id v74 = v58;
LABEL_68:
                              BOOL v64 = [(LNActionOutput *)self shouldShowPrompt];
                              if (v64 == [(LNActionOutput *)v6 shouldShowPrompt])
                              {
                                int64_t v65 = [(LNActionOutput *)self confirmationConditions];
                                LOBYTE(v12) = v65 == [(LNActionOutput *)v6 confirmationConditions];
                                goto LABEL_73;
                              }
LABEL_69:
                              LOBYTE(v12) = 0;
LABEL_73:
                              v60 = v72;
                              id v58 = v74;
                              goto LABEL_74;
                            }
                            if (v58 && v63)
                            {
                              int v71 = [v58 isEqual:v63];
                              id v72 = v12;

                              id v74 = v58;
                              if (!v71) {
                                goto LABEL_69;
                              }
                              goto LABEL_68;
                            }

                            v60 = v12;
                            LOBYTE(v12) = 0;
                            goto LABEL_74;
                          }
                        }
                        else
                        {
                          v52 = v51;
                          id v53 = 0;
                          v19 = v86;
                        }
LABEL_76:
                        v66 = v53;

                        goto LABEL_77;
                      }

                      goto LABEL_54;
                    }
                  }
                  else
                  {
                    v46 = v45;
                    id v47 = 0;
                    v19 = v86;
                  }
LABEL_78:
                  v67 = v47;

                  goto LABEL_79;
                }

                goto LABEL_48;
              }
            }
            else
            {
              v35 = v34;
              id v36 = 0;
              v19 = v86;
            }
LABEL_80:
            id v68 = v28;
            v69 = v36;

            id v28 = v68;
            goto LABEL_81;
          }

          goto LABEL_36;
        }
      }
      else
      {
        v30 = v29;
        v19 = v86;
      }
LABEL_82:

      goto LABEL_83;
    }

    goto LABEL_30;
  }
  LOBYTE(v12) = 1;
LABEL_89:

  return (char)v12;
}

- (unint64_t)hash
{
  id v28 = [(LNActionOutput *)self identifier];
  uint64_t v3 = [v28 hash];
  v27 = [(LNActionOutput *)self identifier];
  uint64_t v4 = [v27 hash] ^ v3;
  v26 = [(LNActionOutput *)self dialog];
  uint64_t v5 = [v26 hash];
  v6 = [(LNActionOutput *)self viewSnippet];
  uint64_t v7 = v4 ^ v5 ^ [v6 hash];
  v8 = [(LNActionOutput *)self value];
  uint64_t v9 = [v8 hash];
  id v10 = [(LNActionOutput *)self showOutputAction];
  uint64_t v11 = v9 ^ [v10 hash];
  int64_t v12 = v7 ^ v11 ^ [(LNActionOutput *)self showOutputActionHint];
  unint64_t v13 = [(LNActionOutput *)self showOutputActionOptions];
  unint64_t v14 = v13 ^ [(LNActionOutput *)self isDeferred];
  int v15 = [(LNActionOutput *)self nextAction];
  uint64_t v16 = v12 ^ v14 ^ [v15 hash];
  v17 = [(LNActionOutput *)self suggestedFollowUpActions];
  uint64_t v18 = [v17 hash];
  v19 = [(LNActionOutput *)self activityIdentifier];
  uint64_t v20 = v18 ^ [v19 hash];
  int v21 = [(LNActionOutput *)self confirmationActionName];
  uint64_t v22 = v20 ^ [v21 hash];
  uint64_t v23 = v22 ^ [(LNActionOutput *)self shouldShowPrompt];
  unint64_t v24 = v16 ^ v23 ^ [(LNActionOutput *)self confirmationConditions];

  return v24;
}

- (id)description
{
  int v21 = NSString;
  uint64_t v3 = (objc_class *)objc_opt_class();
  uint64_t v20 = NSStringFromClass(v3);
  v19 = [(LNActionOutput *)self identifier];
  uint64_t v18 = [(LNActionOutput *)self dialog];
  v17 = [(LNActionOutput *)self viewSnippet];
  uint64_t v4 = [(LNActionOutput *)self attribution];
  uint64_t v16 = [(LNActionOutput *)self value];
  int v15 = [(LNActionOutput *)self showOutputAction];
  int64_t v14 = [(LNActionOutput *)self showOutputActionHint];
  unint64_t v5 = [(LNActionOutput *)self showOutputActionOptions];
  v6 = @"NO";
  if ([(LNActionOutput *)self isDeferred]) {
    uint64_t v7 = @"YES";
  }
  else {
    uint64_t v7 = @"NO";
  }
  v8 = [(LNActionOutput *)self nextAction];
  uint64_t v9 = [(LNActionOutput *)self suggestedFollowUpActions];
  id v10 = [(LNActionOutput *)self activityIdentifier];
  uint64_t v11 = [(LNActionOutput *)self confirmationActionName];
  if ([(LNActionOutput *)self shouldShowPrompt]) {
    v6 = @"YES";
  }
  objc_msgSend(v21, "stringWithFormat:", @"<%@: %p, identifier: %@, dialog: %@, viewSnippet: %@, attribution: %@,value: %@, showOutputAction: %@, showOutputActionHint: %ld, showOutputActionOptions: %ld, deferred: %@, nextAction: %@, suggestedFollowUpActions: %@, activityIdentifier: %@, confirmationActionName: %@, showPrompt: %@, confirmationConditions: %lu>", v20, self, v19, v18, v17, v4, v16, v15, v14, v5, v7, v8, v9, v10, v11, v6,
  int64_t v12 = [(LNActionOutput *)self confirmationConditions]);

  return v12;
}

- (LNActionOutput)initWithCoder:(id)a3
{
  id v3 = a3;
  v25 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
  int v21 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"dialog"];
  uint64_t v18 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"viewSnippet"];
  unint64_t v24 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"attribution"];
  uint64_t v23 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"value"];
  uint64_t v22 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"showOutputAction"];
  uint64_t v20 = [v3 decodeIntegerForKey:@"showOutputActionHint"];
  uint64_t v19 = [v3 decodeIntegerForKey:@"showOutputActionOptions"];
  char v4 = [v3 decodeBoolForKey:@"deferred"];
  unint64_t v5 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"nextAction"];
  v6 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v7 = objc_opt_class();
  v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  v17 = [v3 decodeObjectOfClasses:v8 forKey:@"suggestedFollowUpActions"];

  uint64_t v9 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"activityIdentifier"];
  id v10 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"confirmationActionName"];
  char v11 = [v3 decodeBoolForKey:@"showPrompt"];
  uint64_t v12 = [v3 decodeIntegerForKey:@"confirmationConditions"];
  unint64_t v13 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"undoContext"];

  LOBYTE(v16) = v11;
  LOBYTE(v15) = v4;
  v27 = -[LNActionOutput initWithIdentifier:dialog:viewSnippet:attribution:value:showOutputAction:showOutputActionHint:showOutputActionOptions:deferred:nextAction:suggestedFollowUpActions:activityIdentifier:confirmationActionName:showPrompt:confirmationConditions:undoContext:](self, "initWithIdentifier:dialog:viewSnippet:attribution:value:showOutputAction:showOutputActionHint:showOutputActionOptions:deferred:nextAction:suggestedFollowUpActions:activityIdentifier:confirmationActionName:showPrompt:confirmationConditions:undoContext:", v25, v21, v18, v24, v23, v22, v20, v19, v15, v5, v17, v9, v10, v16, v12,
          v13);

  return v27;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(LNActionOutput *)self identifier];
  [v4 encodeObject:v5 forKey:@"identifier"];

  v6 = [(LNActionOutput *)self dialog];
  [v4 encodeObject:v6 forKey:@"dialog"];

  uint64_t v7 = [(LNActionOutput *)self viewSnippet];
  [v4 encodeObject:v7 forKey:@"viewSnippet"];

  v8 = [(LNActionOutput *)self attribution];
  [v4 encodeObject:v8 forKey:@"attribution"];

  uint64_t v9 = [(LNActionOutput *)self value];
  [v4 encodeObject:v9 forKey:@"value"];

  id v10 = [(LNActionOutput *)self showOutputAction];
  [v4 encodeObject:v10 forKey:@"showOutputAction"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[LNActionOutput showOutputActionHint](self, "showOutputActionHint"), @"showOutputActionHint");
  objc_msgSend(v4, "encodeInteger:forKey:", -[LNActionOutput showOutputActionOptions](self, "showOutputActionOptions"), @"showOutputActionOptions");
  objc_msgSend(v4, "encodeBool:forKey:", -[LNActionOutput isDeferred](self, "isDeferred"), @"deferred");
  char v11 = [(LNActionOutput *)self nextAction];
  [v4 encodeObject:v11 forKey:@"nextAction"];

  uint64_t v12 = [(LNActionOutput *)self suggestedFollowUpActions];
  [v4 encodeObject:v12 forKey:@"suggestedFollowUpActions"];

  unint64_t v13 = [(LNActionOutput *)self activityIdentifier];
  [v4 encodeObject:v13 forKey:@"activityIdentifier"];

  int64_t v14 = [(LNActionOutput *)self confirmationActionName];
  [v4 encodeObject:v14 forKey:@"confirmationActionName"];

  objc_msgSend(v4, "encodeBool:forKey:", -[LNActionOutput shouldShowPrompt](self, "shouldShowPrompt"), @"showPrompt");
  objc_msgSend(v4, "encodeInteger:forKey:", -[LNActionOutput confirmationConditions](self, "confirmationConditions"), @"confirmationConditions");
  id v15 = [(LNActionOutput *)self undoContext];
  [v4 encodeObject:v15 forKey:@"undoContext"];
}

- (LNActionOutput)initWithIdentifier:(id)a3 dialog:(id)a4 viewSnippet:(id)a5 attribution:(id)a6 value:(id)a7 showOutputAction:(id)a8 showOutputActionHint:(int64_t)a9 showOutputActionOptions:(unint64_t)a10 deferred:(BOOL)a11 nextAction:(id)a12 suggestedFollowUpActions:(id)a13 activityIdentifier:(id)a14 confirmationActionName:(id)a15 showPrompt:(BOOL)a16 confirmationConditions:(int64_t)a17 undoContext:(id)a18
{
  id v43 = a3;
  id v41 = a4;
  id v35 = a5;
  id v40 = a5;
  id v36 = a6;
  id v39 = a6;
  id v37 = a7;
  id v23 = a7;
  id v44 = a8;
  id v42 = a12;
  id v24 = a13;
  id v25 = a14;
  id v26 = a15;
  id v27 = a18;
  v45.receiver = self;
  v45.super_class = (Class)LNActionOutput;
  id v28 = [(LNActionOutput *)&v45 init];
  id v29 = v28;
  if (v28)
  {
    objc_storeStrong((id *)&v28->_identifier, a3);
    objc_storeStrong((id *)&v29->_dialog, a4);
    objc_storeStrong((id *)&v29->_viewSnippet, v35);
    objc_storeStrong((id *)&v29->_attribution, v36);
    objc_storeStrong((id *)&v29->_value, v37);
    objc_storeStrong((id *)&v29->_showOutputAction, a8);
    v29->_showOutputActionHint = a9;
    v29->_showOutputActionOptions = a10;
    v29->_deferred = a11;
    objc_storeStrong((id *)&v29->_nextAction, a12);
    objc_storeStrong((id *)&v29->_suggestedFollowUpActions, a13);
    uint64_t v30 = [v25 copy];
    activityIdentifier = v29->_activityIdentifier;
    v29->_activityIdentifier = (NSString *)v30;

    objc_storeStrong((id *)&v29->_confirmationActionName, a15);
    v29->_showPrompt = a16;
    v29->_confirmationConditions = a17;
    objc_storeStrong((id *)&v29->_undoContext, a18);
    v32 = v29;
  }

  return v29;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (LNActionOutput)initWithIdentifier:(id)a3 dialog:(id)a4 viewSnippet:(id)a5 value:(id)a6 showOutputAction:(id)a7 showOutputActionHint:(int64_t)a8 deferred:(BOOL)a9 nextAction:(id)a10 suggestedFollowUpActions:(id)a11 activityIdentifier:(id)a12 confirmationActionName:(id)a13 showPrompt:(BOOL)a14 confirmationConditions:(int64_t)a15 undoContext:(id)a16
{
  LOBYTE(v18) = a14;
  LOBYTE(v17) = a9;
  return [(LNActionOutput *)self initWithIdentifier:a3 dialog:a4 viewSnippet:a5 value:a6 showOutputAction:a7 showOutputActionHint:a8 showOutputActionOptions:0 deferred:v17 nextAction:a10 suggestedFollowUpActions:a11 activityIdentifier:a12 confirmationActionName:a13 showPrompt:v18 confirmationConditions:a15 undoContext:a16];
}

- (LNActionOutput)initWithIdentifier:(id)a3 dialog:(id)a4 viewSnippet:(id)a5 value:(id)a6 showOutputAction:(id)a7 showOutputActionHint:(int64_t)a8 deferred:(BOOL)a9 nextAction:(id)a10 activityIdentifier:(id)a11 confirmationActionName:(id)a12 showPrompt:(BOOL)a13
{
  LOBYTE(v15) = a13;
  LOBYTE(v14) = a9;
  return [(LNActionOutput *)self initWithIdentifier:a3 dialog:a4 viewSnippet:a5 value:a6 showOutputAction:a7 showOutputActionHint:a8 deferred:v14 nextAction:a10 suggestedFollowUpActions:0 activityIdentifier:0 confirmationActionName:a12 showPrompt:v15 confirmationConditions:0 undoContext:0];
}

- (LNActionOutput)initWithIdentifier:(id)a3 dialog:(id)a4 viewSnippet:(id)a5 value:(id)a6 showOutputAction:(id)a7 showOutputActionHint:(int64_t)a8 deferred:(BOOL)a9 nextAction:(id)a10 confirmationActionName:(id)a11 showPrompt:(BOOL)a12 undoContext:(id)a13
{
  LOBYTE(v15) = a12;
  LOBYTE(v14) = a9;
  return [(LNActionOutput *)self initWithIdentifier:a3 dialog:a4 viewSnippet:a5 value:a6 showOutputAction:a7 showOutputActionHint:a8 deferred:v14 nextAction:a10 suggestedFollowUpActions:0 activityIdentifier:0 confirmationActionName:a11 showPrompt:v15 confirmationConditions:0 undoContext:a13];
}

- (LNActionOutput)initWithIdentifier:(id)a3 dialog:(id)a4 viewSnippet:(id)a5 value:(id)a6 showOutputAction:(id)a7 deferred:(BOOL)a8 nextAction:(id)a9 confirmationActionName:(id)a10 showPrompt:(BOOL)a11
{
  LOBYTE(v13) = a11;
  LOBYTE(v12) = a8;
  return [(LNActionOutput *)self initWithIdentifier:a3 dialog:a4 viewSnippet:a5 value:a6 showOutputAction:a7 showOutputActionHint:0 deferred:v12 nextAction:a9 confirmationActionName:a10 showPrompt:v13 undoContext:0];
}

- (LNActionOutput)initWithIdentifier:(id)a3 dialog:(id)a4 viewSnippet:(id)a5 value:(id)a6 showOutputAction:(id)a7 deferred:(BOOL)a8 nextAction:(id)a9 confirmationActionName:(id)a10
{
  LOBYTE(v11) = 1;
  return [(LNActionOutput *)self initWithIdentifier:a3 dialog:a4 viewSnippet:a5 value:a6 showOutputAction:a7 deferred:a8 nextAction:a9 confirmationActionName:a10 showPrompt:v11];
}

- (LNActionOutput)initWithIdentifier:(id)a3 dialog:(id)a4 viewSnippet:(id)a5 value:(id)a6 showOutputAction:(id)a7 showOutputActionHint:(int64_t)a8 showOutputActionOptions:(unint64_t)a9 deferred:(BOOL)a10 nextAction:(id)a11 suggestedFollowUpActions:(id)a12 activityIdentifier:(id)a13 confirmationActionName:(id)a14 showPrompt:(BOOL)a15 confirmationConditions:(int64_t)a16 undoContext:(id)a17
{
  LOBYTE(v19) = a15;
  LOBYTE(v18) = a10;
  return -[LNActionOutput initWithIdentifier:dialog:viewSnippet:attribution:value:showOutputAction:showOutputActionHint:showOutputActionOptions:deferred:nextAction:suggestedFollowUpActions:activityIdentifier:confirmationActionName:showPrompt:confirmationConditions:undoContext:](self, "initWithIdentifier:dialog:viewSnippet:attribution:value:showOutputAction:showOutputActionHint:showOutputActionOptions:deferred:nextAction:suggestedFollowUpActions:activityIdentifier:confirmationActionName:showPrompt:confirmationConditions:undoContext:", a3, a4, a5, 0, a6, a7, a8, 0, v18, a11, a12, a13, a14, v19, a16,
           a17);
}

@end