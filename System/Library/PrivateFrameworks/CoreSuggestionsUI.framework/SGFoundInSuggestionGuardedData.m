@interface SGFoundInSuggestionGuardedData
@end

@implementation SGFoundInSuggestionGuardedData

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageService, 0);
  objc_storeStrong((id *)&self->_mailService, 0);
}

@end