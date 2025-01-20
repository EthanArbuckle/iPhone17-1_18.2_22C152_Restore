@interface DOCPersonSuggester
@end

@implementation DOCPersonSuggester

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC33com_apple_DocumentManager_Service18DOCPersonSuggester_currentQuery));
}

@end