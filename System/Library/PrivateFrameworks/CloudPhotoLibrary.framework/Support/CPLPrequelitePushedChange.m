@interface CPLPrequelitePushedChange
- (id)initFromPQLResultSet:(id)a3 error:(id *)a4;
@end

@implementation CPLPrequelitePushedChange

- (id)initFromPQLResultSet:(id)a3 error:(id *)a4
{
  return sub_1001B25F0(self, a3, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_change, 0);
  objc_storeStrong((id *)&self->_pushContext, 0);
  objc_storeStrong((id *)&self->_secondaryIdentifier, 0);
  objc_storeStrong((id *)&self->_relatedIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_changeClass, 0);
  objc_storeStrong((id *)&self->_serializedRecord, 0);
}

@end