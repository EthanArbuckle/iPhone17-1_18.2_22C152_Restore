@interface AFDialogPhase
+ (BOOL)supportsSecureCoding;
+ (id)_dialogPhaseWithType:(int64_t)a3;
+ (id)acknowledgementDialogPhase;
+ (id)cancelledDialogPhase;
+ (id)clarificationDialogPhase;
+ (id)completionDialogPhase;
+ (id)confirmationDialogPhase;
+ (id)confirmedDialogPhase;
+ (id)dialogPhaseForAceDialogPhase:(id)a3;
+ (id)errorDialogPhase;
+ (id)reflectionDialogPhase;
+ (id)statusDialogPhase;
+ (id)summaryDialogPhase;
+ (id)userRequestDialogPhase;
- (AFDialogPhase)initWithCoder:(id)a3;
- (BOOL)isAcknowledgementDialogPhase;
- (BOOL)isCancelledDialogPhase;
- (BOOL)isClarificationDialogPhase;
- (BOOL)isCompletionDialogPhase;
- (BOOL)isConfirmationDialogPhase;
- (BOOL)isConfirmedDialogPhase;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToDialogPhase:(id)a3;
- (BOOL)isErrorDialogPhase;
- (BOOL)isExpository;
- (BOOL)isPossiblyPartOfMultiTurnRequest;
- (BOOL)isReflectionDialogPhase;
- (BOOL)isSummaryDialogPhase;
- (BOOL)isTemporary;
- (BOOL)isUserRequestDialogPhase;
- (BOOL)replacesPreviousSnippetContents;
- (NSString)aceDialogPhaseValue;
- (id)_initWithType:(int64_t)a3;
- (id)description;
- (int)UEIUUFRReadyDialogPhase;
- (int64_t)_type;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AFDialogPhase

- (int64_t)_type
{
  return self->_type;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (AFDialogPhase *)a3;
  if (v4 == self)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(AFDialogPhase *)self isEqualToDialogPhase:v4];
  }

  return v5;
}

- (id)description
{
  v3 = +[AFDialogPhase acknowledgementDialogPhase];
  BOOL v4 = [(AFDialogPhase *)self isEqualToDialogPhase:v3];

  if (v4)
  {
    BOOL v5 = @"acknowledgementDialogPhase";
  }
  else
  {
    v6 = +[AFDialogPhase reflectionDialogPhase];
    BOOL v7 = [(AFDialogPhase *)self isEqualToDialogPhase:v6];

    if (v7)
    {
      BOOL v5 = @"reflectionDialogPhase";
    }
    else
    {
      v8 = +[AFDialogPhase statusDialogPhase];
      BOOL v9 = [(AFDialogPhase *)self isEqualToDialogPhase:v8];

      if (v9)
      {
        BOOL v5 = @"statusDialogPhase";
      }
      else
      {
        v10 = +[AFDialogPhase clarificationDialogPhase];
        BOOL v11 = [(AFDialogPhase *)self isEqualToDialogPhase:v10];

        if (v11)
        {
          BOOL v5 = @"clarificationDialogPhase";
        }
        else
        {
          v12 = +[AFDialogPhase summaryDialogPhase];
          BOOL v13 = [(AFDialogPhase *)self isEqualToDialogPhase:v12];

          if (v13)
          {
            BOOL v5 = @"summaryDialogPhase";
          }
          else
          {
            v14 = +[AFDialogPhase confirmationDialogPhase];
            BOOL v15 = [(AFDialogPhase *)self isEqualToDialogPhase:v14];

            if (v15)
            {
              BOOL v5 = @"confirmationDialogPhase";
            }
            else
            {
              v16 = +[AFDialogPhase completionDialogPhase];
              BOOL v17 = [(AFDialogPhase *)self isEqualToDialogPhase:v16];

              if (v17)
              {
                BOOL v5 = @"completionDialogPhase";
              }
              else
              {
                v18 = +[AFDialogPhase errorDialogPhase];
                BOOL v19 = [(AFDialogPhase *)self isEqualToDialogPhase:v18];

                if (v19)
                {
                  BOOL v5 = @"errorDialogPhase";
                }
                else
                {
                  v20 = +[AFDialogPhase confirmedDialogPhase];
                  BOOL v21 = [(AFDialogPhase *)self isEqualToDialogPhase:v20];

                  if (v21)
                  {
                    BOOL v5 = @"confirmedDialogPhase";
                  }
                  else
                  {
                    v22 = +[AFDialogPhase cancelledDialogPhase];
                    BOOL v23 = [(AFDialogPhase *)self isEqualToDialogPhase:v22];

                    if (v23)
                    {
                      BOOL v5 = @"cancelledDialogPhase";
                    }
                    else
                    {
                      v24 = +[AFDialogPhase userRequestDialogPhase];
                      BOOL v25 = [(AFDialogPhase *)self isEqualToDialogPhase:v24];

                      if (v25) {
                        BOOL v5 = @"userRequestDialogPhase";
                      }
                      else {
                        BOOL v5 = @"unknown dialogPhase";
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return (id)[NSString stringWithFormat:@"<%@ %@>", objc_opt_class(), v5];
}

- (int)UEIUUFRReadyDialogPhase
{
  int64_t v2 = [(AFDialogPhase *)self _type];
  if ((unint64_t)(v2 - 1) >= 0xB) {
    LODWORD(v2) = 0;
  }
  return v2;
}

- (BOOL)isPossiblyPartOfMultiTurnRequest
{
  unint64_t v2 = [(AFDialogPhase *)self _type];
  return (v2 < 0xC) & (0x850u >> v2);
}

- (BOOL)isAcknowledgementDialogPhase
{
  return [(AFDialogPhase *)self _type] == 1;
}

- (BOOL)isSummaryDialogPhase
{
  return [(AFDialogPhase *)self _type] == 5;
}

- (BOOL)isCompletionDialogPhase
{
  return [(AFDialogPhase *)self _type] == 7;
}

- (BOOL)isErrorDialogPhase
{
  return [(AFDialogPhase *)self _type] == 8;
}

- (BOOL)isUserRequestDialogPhase
{
  return [(AFDialogPhase *)self _type] == 11;
}

- (BOOL)isCancelledDialogPhase
{
  return [(AFDialogPhase *)self _type] == 10;
}

- (BOOL)isConfirmedDialogPhase
{
  return [(AFDialogPhase *)self _type] == 9;
}

- (BOOL)isClarificationDialogPhase
{
  return [(AFDialogPhase *)self _type] == 4;
}

- (BOOL)isReflectionDialogPhase
{
  return [(AFDialogPhase *)self _type] == 2;
}

- (BOOL)isConfirmationDialogPhase
{
  return [(AFDialogPhase *)self _type] == 6;
}

- (BOOL)isExpository
{
  return (unint64_t)([(AFDialogPhase *)self _type] - 1) < 3;
}

- (BOOL)isTemporary
{
  unint64_t v2 = [(AFDialogPhase *)self _type];
  return (v2 < 9) & (0x14Eu >> v2);
}

- (BOOL)replacesPreviousSnippetContents
{
  unint64_t v2 = [(AFDialogPhase *)self _type];
  return (v2 < 8) & (0xB0u >> v2);
}

- (NSString)aceDialogPhaseValue
{
  int64_t v3 = [(AFDialogPhase *)self _type] - 1;
  id v4 = 0;
  BOOL v5 = (id *)MEMORY[0x1E4F97790];
  switch(v3)
  {
    case 0:
      goto LABEL_11;
    case 1:
      BOOL v5 = (id *)MEMORY[0x1E4F977C8];
      goto LABEL_11;
    case 2:
      BOOL v5 = (id *)MEMORY[0x1E4F977D0];
      goto LABEL_11;
    case 3:
      BOOL v5 = (id *)MEMORY[0x1E4F977A0];
      goto LABEL_11;
    case 4:
      BOOL v5 = (id *)MEMORY[0x1E4F977D8];
      goto LABEL_11;
    case 5:
      BOOL v5 = (id *)MEMORY[0x1E4F977B0];
      goto LABEL_11;
    case 6:
      BOOL v5 = (id *)MEMORY[0x1E4F977A8];
      goto LABEL_11;
    case 7:
      BOOL v5 = (id *)MEMORY[0x1E4F977C0];
      goto LABEL_11;
    case 8:
      BOOL v5 = (id *)MEMORY[0x1E4F977B8];
      goto LABEL_11;
    case 9:
      BOOL v5 = (id *)MEMORY[0x1E4F97798];
LABEL_11:
      id v4 = *v5;
      break;
    case 10:
      break;
    default:
      BOOL v7 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v8 = *MEMORY[0x1E4F1C3B8];
      BOOL v9 = objc_msgSend(NSString, "stringWithFormat:", @"Unexpected value for _type: %ld", -[AFDialogPhase _type](self, "_type"));
      id v10 = [v7 exceptionWithName:v8 reason:v9 userInfo:0];

      objc_exception_throw(v10);
  }
  return (NSString *)v4;
}

- (BOOL)isEqualToDialogPhase:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(AFDialogPhase *)self _type];
  uint64_t v6 = [v4 _type];

  return v5 == v6;
}

- (AFDialogPhase)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)AFDialogPhase;
  int64_t v5 = [(AFDialogPhase *)&v7 init];
  if (v5) {
    v5->_type = [v4 decodeIntegerForKey:@"AFDialogPhaseType"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[AFDialogPhase _type](self, "_type"), @"AFDialogPhaseType");
}

- (id)_initWithType:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)AFDialogPhase;
  id result = [(AFDialogPhase *)&v5 init];
  if (result) {
    *((void *)result + 1) = a3;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)_dialogPhaseWithType:(int64_t)a3
{
  id v3 = [[AFDialogPhase alloc] _initWithType:a3];
  return v3;
}

+ (id)userRequestDialogPhase
{
  return (id)[a1 _dialogPhaseWithType:11];
}

+ (id)cancelledDialogPhase
{
  return (id)[a1 _dialogPhaseWithType:10];
}

+ (id)confirmedDialogPhase
{
  return (id)[a1 _dialogPhaseWithType:9];
}

+ (id)errorDialogPhase
{
  return (id)[a1 _dialogPhaseWithType:8];
}

+ (id)completionDialogPhase
{
  return (id)[a1 _dialogPhaseWithType:7];
}

+ (id)confirmationDialogPhase
{
  return (id)[a1 _dialogPhaseWithType:6];
}

+ (id)summaryDialogPhase
{
  return (id)[a1 _dialogPhaseWithType:5];
}

+ (id)clarificationDialogPhase
{
  return (id)[a1 _dialogPhaseWithType:4];
}

+ (id)statusDialogPhase
{
  return (id)[a1 _dialogPhaseWithType:3];
}

+ (id)reflectionDialogPhase
{
  return (id)[a1 _dialogPhaseWithType:2];
}

+ (id)acknowledgementDialogPhase
{
  return (id)[a1 _dialogPhaseWithType:1];
}

+ (id)dialogPhaseForAceDialogPhase:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:*MEMORY[0x1E4F97790]])
  {
    uint64_t v4 = +[AFDialogPhase acknowledgementDialogPhase];
LABEL_21:
    objc_super v5 = (void *)v4;
    goto LABEL_22;
  }
  if ([v3 isEqualToString:*MEMORY[0x1E4F977C8]])
  {
    uint64_t v4 = +[AFDialogPhase reflectionDialogPhase];
    goto LABEL_21;
  }
  if ([v3 isEqualToString:*MEMORY[0x1E4F977D0]])
  {
    uint64_t v4 = +[AFDialogPhase statusDialogPhase];
    goto LABEL_21;
  }
  if ([v3 isEqualToString:*MEMORY[0x1E4F977A0]])
  {
    uint64_t v4 = +[AFDialogPhase clarificationDialogPhase];
    goto LABEL_21;
  }
  if ([v3 isEqualToString:*MEMORY[0x1E4F977D8]])
  {
    uint64_t v4 = +[AFDialogPhase summaryDialogPhase];
    goto LABEL_21;
  }
  if ([v3 isEqualToString:*MEMORY[0x1E4F977B0]])
  {
    uint64_t v4 = +[AFDialogPhase confirmationDialogPhase];
    goto LABEL_21;
  }
  if ([v3 isEqualToString:*MEMORY[0x1E4F977A8]])
  {
    uint64_t v4 = +[AFDialogPhase completionDialogPhase];
    goto LABEL_21;
  }
  if ([v3 isEqualToString:*MEMORY[0x1E4F977C0]])
  {
    uint64_t v4 = +[AFDialogPhase errorDialogPhase];
    goto LABEL_21;
  }
  if ([v3 isEqualToString:*MEMORY[0x1E4F977B8]])
  {
    uint64_t v4 = +[AFDialogPhase confirmedDialogPhase];
    goto LABEL_21;
  }
  if ([v3 isEqualToString:*MEMORY[0x1E4F97798]])
  {
    uint64_t v4 = +[AFDialogPhase cancelledDialogPhase];
    goto LABEL_21;
  }
  objc_super v5 = 0;
LABEL_22:

  return v5;
}

@end