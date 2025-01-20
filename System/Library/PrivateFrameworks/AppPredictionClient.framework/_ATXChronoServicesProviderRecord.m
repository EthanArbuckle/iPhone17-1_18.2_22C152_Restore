@interface _ATXChronoServicesProviderRecord
- (BSInvalidatable)widgetHandle;
- (CHSWidget)widget;
- (NSString)suggestedStackId;
- (unint64_t)state;
- (void)setState:(unint64_t)a3;
- (void)setSuggestedStackId:(id)a3;
- (void)setWidget:(id)a3;
- (void)setWidgetHandle:(id)a3;
@end

@implementation _ATXChronoServicesProviderRecord

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (CHSWidget)widget
{
  return self->_widget;
}

- (void)setWidget:(id)a3
{
}

- (BSInvalidatable)widgetHandle
{
  return self->_widgetHandle;
}

- (void)setWidgetHandle:(id)a3
{
}

- (NSString)suggestedStackId
{
  return self->_suggestedStackId;
}

- (void)setSuggestedStackId:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestedStackId, 0);
  objc_storeStrong((id *)&self->_widgetHandle, 0);

  objc_storeStrong((id *)&self->_widget, 0);
}

@end