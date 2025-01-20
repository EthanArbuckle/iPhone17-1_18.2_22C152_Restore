@interface DSPGCoreMLInfo
@end

@implementation DSPGCoreMLInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputProvider, 0);
  objc_storeStrong((id *)&self->_inputProvider, 0);
  objc_storeStrong((id *)&self->_feedbackConnections, 0);

  objc_storeStrong((id *)&self->_model, 0);
}

@end