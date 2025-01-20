@interface AMSUIPaymentSheetViewProvider
- (_TtC33AppleMediaServicesUIPaymentSheets29AMSUIPaymentSheetViewProvider)init;
@end

@implementation AMSUIPaymentSheetViewProvider

- (_TtC33AppleMediaServicesUIPaymentSheets29AMSUIPaymentSheetViewProvider)init
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC33AppleMediaServicesUIPaymentSheets29AMSUIPaymentSheetViewProvider_context));
  sub_23CACAEBC(*(void **)((char *)&self->super.isa+ OBJC_IVAR____TtC33AppleMediaServicesUIPaymentSheets29AMSUIPaymentSheetViewProvider_request), *(void *)&self->context[OBJC_IVAR____TtC33AppleMediaServicesUIPaymentSheets29AMSUIPaymentSheetViewProvider_request], *(void *)&self->request[OBJC_IVAR____TtC33AppleMediaServicesUIPaymentSheets29AMSUIPaymentSheetViewProvider_request]);
  OUTLINED_FUNCTION_5(OBJC_IVAR____TtC33AppleMediaServicesUIPaymentSheets29AMSUIPaymentSheetViewProvider_header);
  OUTLINED_FUNCTION_5(OBJC_IVAR____TtC33AppleMediaServicesUIPaymentSheets29AMSUIPaymentSheetViewProvider_content);
  OUTLINED_FUNCTION_5(OBJC_IVAR____TtC33AppleMediaServicesUIPaymentSheets29AMSUIPaymentSheetViewProvider_footer);
  OUTLINED_FUNCTION_5(OBJC_IVAR____TtC33AppleMediaServicesUIPaymentSheets29AMSUIPaymentSheetViewProvider_secondaryContent);
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC33AppleMediaServicesUIPaymentSheets29AMSUIPaymentSheetViewProvider_secondaryFooter);
  sub_23CACB934(v3);
}

@end