@interface IMTapbackSummaryActionStringFormat
- (BOOL)requiresReactionReplacment;
- (IMTapbackSummaryActionStringFormat)initWithActionStringFormat:(id)a3 requiresReactionReplacment:(BOOL)a4;
- (NSString)actionStringFormat;
@end

@implementation IMTapbackSummaryActionStringFormat

- (void).cxx_destruct
{
}

- (BOOL)requiresReactionReplacment
{
  return self->_requiresReactionReplacment;
}

- (NSString)actionStringFormat
{
  return self->_actionStringFormat;
}

- (IMTapbackSummaryActionStringFormat)initWithActionStringFormat:(id)a3 requiresReactionReplacment:(BOOL)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)IMTapbackSummaryActionStringFormat;
  v7 = [(IMTapbackSummaryActionStringFormat *)&v11 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    actionStringFormat = v7->_actionStringFormat;
    v7->_actionStringFormat = (NSString *)v8;

    v7->_requiresReactionReplacment = a4;
  }

  return v7;
}

@end