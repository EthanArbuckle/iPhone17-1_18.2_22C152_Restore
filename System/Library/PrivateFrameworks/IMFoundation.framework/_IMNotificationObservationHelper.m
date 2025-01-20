@interface _IMNotificationObservationHelper
- (_IMNotificationObservationHelper)initWithObserver:(id)a3 name:(id)a4 object:(id)a5 block:(id)a6;
- (void)_notification:(id)a3;
- (void)dealloc;
@end

@implementation _IMNotificationObservationHelper

- (_IMNotificationObservationHelper)initWithObserver:(id)a3 name:(id)a4 object:(id)a5 block:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v33.receiver = self;
  v33.super_class = (Class)_IMNotificationObservationHelper;
  v15 = [(_IMNotificationObservationHelper *)&v33 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong(&v15->_observer, a3);
    uint64_t v20 = objc_msgSend_copy(v14, v17, v18, v19);
    id block = v16->_block;
    v16->_id block = (id)v20;

    uint64_t v25 = objc_msgSend_copy(v12, v22, v23, v24);
    name = v16->_name;
    v16->_name = (NSString *)v25;

    objc_storeStrong(&v16->_object, a5);
    v30 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v27, v28, v29);
    objc_msgSend_addObserver_selector_name_object_(v30, v31, (uint64_t)v16, (uint64_t)sel__notification_, v12, v13);
  }
  return v16;
}

- (void)dealloc
{
  v5 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], a2, v2, v3);
  objc_msgSend_removeObserver_name_object_(v5, v6, (uint64_t)self, (uint64_t)self->_name, self->_object);

  v7.receiver = self;
  v7.super_class = (Class)_IMNotificationObservationHelper;
  [(_IMNotificationObservationHelper *)&v7 dealloc];
}

- (void)_notification:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong(&self->_block, 0);
  objc_storeStrong(&self->_object, 0);
  objc_storeStrong(&self->_observer, 0);
}

@end