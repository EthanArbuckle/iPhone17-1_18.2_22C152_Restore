@interface HDPendingNotificationInstructions
- (BOOL)isEqual:(id)a3;
- (HDPendingNotificationInstructions)initWithAction:(int64_t)a3 instructions:(id)a4;
- (NSSet)categoryIdentifiers;
- (NSSet)instructions;
- (NSSet)messageIdentifiers;
- (id)description;
- (int64_t)action;
- (unint64_t)hash;
@end

@implementation HDPendingNotificationInstructions

- (HDPendingNotificationInstructions)initWithAction:(int64_t)a3 instructions:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HDPendingNotificationInstructions;
  v7 = [(HDPendingNotificationInstructions *)&v12 init];
  v8 = v7;
  if (v7)
  {
    v7->_action = a3;
    uint64_t v9 = [v6 copy];
    instructions = v8->_instructions;
    v8->_instructions = (NSSet *)v9;
  }
  return v8;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = NSStringFromHKNotificationInstructionAction();
  id v6 = [(HDPendingNotificationInstructions *)self messageIdentifiers];
  v7 = [(HDPendingNotificationInstructions *)self categoryIdentifiers];
  v8 = [v3 stringWithFormat:@"<%@:%@ mIDs:%@, cIDs:%@>", v4, v5, v6, v7];

  return v8;
}

- (NSSet)messageIdentifiers
{
  return (NSSet *)[(NSSet *)self->_instructions hk_map:&__block_literal_global_166];
}

uint64_t __55__HDPendingNotificationInstructions_messageIdentifiers__block_invoke(uint64_t a1, void *a2)
{
  return [a2 messageIdentifier];
}

- (NSSet)categoryIdentifiers
{
  return (NSSet *)[(NSSet *)self->_instructions hk_map:&__block_literal_global_312_0];
}

uint64_t __56__HDPendingNotificationInstructions_categoryIdentifiers__block_invoke(uint64_t a1, void *a2)
{
  return [a2 categoryIdentifier];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (HDPendingNotificationInstructions *)a3;
  if (self == v4)
  {
    char v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      if (self->_action != v5->_action) {
        goto LABEL_9;
      }
      instructions = self->_instructions;
      v7 = v5->_instructions;
      if (instructions == v7)
      {
        char v8 = 1;
        goto LABEL_11;
      }
      if (v7) {
        char v8 = -[NSSet isEqual:](instructions, "isEqual:");
      }
      else {
LABEL_9:
      }
        char v8 = 0;
LABEL_11:

      goto LABEL_12;
    }
    char v8 = 0;
  }
LABEL_12:

  return v8;
}

- (unint64_t)hash
{
  int64_t action = self->_action;
  return [(NSSet *)self->_instructions hash] ^ action;
}

- (int64_t)action
{
  return self->_action;
}

- (NSSet)instructions
{
  return self->_instructions;
}

- (void).cxx_destruct
{
}

@end