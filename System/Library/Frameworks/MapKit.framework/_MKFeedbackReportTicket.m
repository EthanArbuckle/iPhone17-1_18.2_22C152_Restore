@interface _MKFeedbackReportTicket
- (GEOMapServiceTraits)traits;
- (_MKFeedbackReportTicket)initWithFeedbackReportTicket:(id)a3;
- (void)cancel;
- (void)submitWithCallbackQueue:(id)a3 handler:(id)a4 networkActivity:(id)a5;
- (void)submitWithHandler:(id)a3 networkActivity:(id)a4;
@end

@implementation _MKFeedbackReportTicket

- (_MKFeedbackReportTicket)initWithFeedbackReportTicket:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_MKFeedbackReportTicket;
  v6 = [(_MKFeedbackReportTicket *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_ticket, a3);
  }

  return v7;
}

- (void)submitWithHandler:(id)a3 networkActivity:(id)a4
{
}

- (void)submitWithCallbackQueue:(id)a3 handler:(id)a4 networkActivity:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  ticket = self->_ticket;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __75___MKFeedbackReportTicket_submitWithCallbackQueue_handler_networkActivity___block_invoke;
  v18[3] = &unk_1E54BAF70;
  id v20 = v9;
  id v19 = v8;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __75___MKFeedbackReportTicket_submitWithCallbackQueue_handler_networkActivity___block_invoke_3;
  v15[3] = &unk_1E54BAFC0;
  id v16 = v19;
  id v17 = v10;
  id v12 = v19;
  id v13 = v10;
  id v14 = v9;
  [(GEOMapServiceFeedbackReportTicket *)ticket submitWithHandler:v18 networkActivity:v15];
}

- (void)cancel
{
}

- (GEOMapServiceTraits)traits
{
  return (GEOMapServiceTraits *)[(GEOMapServiceFeedbackReportTicket *)self->_ticket traits];
}

- (void).cxx_destruct
{
}

@end