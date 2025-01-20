@interface IMClassicTapback
+ (BOOL)isValidAssociatedMessageType:(int64_t)a3;
+ (id)classicTapbackOptions;
- (IMClassicTapback)counterpart;
- (IMClassicTapback)initWithAssociatedMessageType:(int64_t)a3;
- (IMClassicTapback)removedTapbackCounterpart;
- (IMClassicTapback)visibleTapbackCounterpart;
- (id)actionStringFormatWithAdaptiveImageGlyphAvailable:(BOOL)a3;
- (id)reactionStringWithAdaptiveImageGlyph:(id)a3 isCommSafetySensitiveProvider:(id)a4;
@end

@implementation IMClassicTapback

- (IMClassicTapback)initWithAssociatedMessageType:(int64_t)a3
{
  v4.receiver = self;
  v4.super_class = (Class)IMClassicTapback;
  return [(IMTapback *)&v4 initWithAssociatedMessageType:a3];
}

+ (BOOL)isValidAssociatedMessageType:(int64_t)a3
{
  return (unint64_t)(a3 - 2000) < 6 || (unint64_t)(a3 - 3000) < 6;
}

- (id)actionStringFormatWithAdaptiveImageGlyphAvailable:(BOOL)a3
{
  uint64_t v4 = [(IMTapback *)self associatedMessageType];
  v5 = 0;
  if (v4 > 2999)
  {
    switch(v4)
    {
      case 3000:
        v5 = @"Removed a heart from";
        break;
      case 3001:
        v5 = @"Removed a like from";
        break;
      case 3002:
        v5 = @"Removed a dislike from";
        break;
      case 3003:
        v5 = @"Removed a laugh from";
        break;
      case 3004:
        v5 = @"Removed an exclamation from";
        break;
      case 3005:
        v5 = @"Removed a question mark from";
        break;
      case 3006:
      case 3007:
LABEL_9:
        v6 = IMLogHandleForCategory("IMClassicTapback");
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
          sub_1A09EF4FC(self, v6);
        }

        v5 = 0;
        break;
      default:
        break;
    }
  }
  else
  {
    switch(v4)
    {
      case 2000:
        v5 = @"Loved";
        break;
      case 2001:
        v5 = @"Liked";
        break;
      case 2002:
        v5 = @"Disliked";
        break;
      case 2003:
        v5 = @"Laughed at";
        break;
      case 2004:
        v5 = @"Emphasized";
        break;
      case 2005:
        v5 = @"Questioned";
        break;
      case 2006:
      case 2007:
        goto LABEL_9;
      default:
        if ((unint64_t)v4 <= 3 && v4 != 1 || (unint64_t)(v4 - 1000) < 2) {
          goto LABEL_9;
        }
        break;
    }
  }
  v7 = [[IMTapbackSummaryActionStringFormat alloc] initWithActionStringFormat:v5 requiresReactionReplacment:0];

  return v7;
}

- (id)reactionStringWithAdaptiveImageGlyph:(id)a3 isCommSafetySensitiveProvider:(id)a4
{
  return 0;
}

- (IMClassicTapback)removedTapbackCounterpart
{
  if ([(IMTapback *)self isRemoved]) {
    v3 = self;
  }
  else {
    v3 = [[IMClassicTapback alloc] initWithAssociatedMessageType:IMCounterpartAcknowledgmentTypeForAcknowledgmentType([(IMTapback *)self associatedMessageType])];
  }

  return v3;
}

- (IMClassicTapback)visibleTapbackCounterpart
{
  if ([(IMTapback *)self isRemoved]) {
    v3 = [[IMClassicTapback alloc] initWithAssociatedMessageType:IMCounterpartAcknowledgmentTypeForAcknowledgmentType([(IMTapback *)self associatedMessageType])];
  }
  else {
    v3 = self;
  }

  return v3;
}

- (IMClassicTapback)counterpart
{
  if ([(IMTapback *)self isRemoved]) {
    [(IMClassicTapback *)self visibleTapbackCounterpart];
  }
  else {
  v3 = [(IMClassicTapback *)self removedTapbackCounterpart];
  }

  return (IMClassicTapback *)v3;
}

+ (id)classicTapbackOptions
{
  v10[6] = *MEMORY[0x1E4F143B8];
  v2 = [[IMClassicTapback alloc] initWithAssociatedMessageType:2000];
  v3 = [[IMClassicTapback alloc] initWithAssociatedMessageType:2001];
  uint64_t v4 = [[IMClassicTapback alloc] initWithAssociatedMessageType:2002];
  v5 = [[IMClassicTapback alloc] initWithAssociatedMessageType:2003];
  v6 = [[IMClassicTapback alloc] initWithAssociatedMessageType:2004];
  v7 = [[IMClassicTapback alloc] initWithAssociatedMessageType:2005];
  v10[0] = v2;
  v10[1] = v3;
  v10[2] = v4;
  v10[3] = v5;
  v10[4] = v6;
  v10[5] = v7;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:6];

  return v8;
}

@end