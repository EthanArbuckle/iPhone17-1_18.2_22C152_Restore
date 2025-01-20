@interface PresentTapToRadarRequestFlow
@end

@implementation PresentTapToRadarRequestFlow

- (void).cxx_destruct
{
  objc_storeStrong(&self->_descriptionBlock, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_message, 0);
}

@end