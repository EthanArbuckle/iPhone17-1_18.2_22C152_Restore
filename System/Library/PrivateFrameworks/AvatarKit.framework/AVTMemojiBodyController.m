@interface AVTMemojiBodyController
@end

@implementation AVTMemojiBodyController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rightHandModel, 0);
  objc_storeStrong((id *)&self->_leftHandModel, 0);
  objc_storeStrong((id *)&self->_rightHand, 0);
  objc_storeStrong((id *)&self->_leftHand, 0);
  objc_storeStrong((id *)&self->_bodyRoot, 0);
  objc_storeStrong((id *)&self->_rightHandJoints, 0);
  objc_storeStrong((id *)&self->_leftHandJoints, 0);
  objc_storeStrong((id *)&self->_bodyJoints, 0);
}

@end