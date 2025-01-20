@interface _EAEmailAddressSetEnumerator
- (_EAEmailAddressSetEnumerator)initWithSet:(id)a3;
- (id)nextObject;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
@end

@implementation _EAEmailAddressSetEnumerator

- (_EAEmailAddressSetEnumerator)initWithSet:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_EAEmailAddressSetEnumerator;
  v6 = [(_EAEmailAddressSetEnumerator *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_set, a3);
  }

  return v7;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return [(EAEmailAddressSet *)self->_set countByEnumeratingWithState:a3 objects:a4 count:a5];
}

- (id)nextObject
{
  id v4 = 0;
  id v2 = [(EAEmailAddressSet *)self->_set countByEnumeratingWithState:&self->_state objects:&v4 count:1];
  if (v2) {
    id v2 = v4;
  }
  return v2;
}

- (void).cxx_destruct
{
}

@end