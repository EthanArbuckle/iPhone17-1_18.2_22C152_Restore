@interface MUCallToActionSectionController
- (MUPlaceCallToActionSectionControllerDelegate)callToActionDelegate;
- (void)setCallToActionDelegate:(id)a3;
@end

@implementation MUCallToActionSectionController

- (MUPlaceCallToActionSectionControllerDelegate)callToActionDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_callToActionDelegate);
  return (MUPlaceCallToActionSectionControllerDelegate *)WeakRetained;
}

- (void)setCallToActionDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end