@interface AppLedgerEvent
@end

@implementation AppLedgerEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originator, 0);
  objc_storeStrong((id *)&self->_logKey, 0);
  objc_storeStrong((id *)&self->_itemID, 0);
  objc_storeStrong((id *)&self->_installDate, 0);
  objc_storeStrong((id *)&self->_externalVersionID, 0);
  objc_storeStrong((id *)&self->_bundleVersion, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end